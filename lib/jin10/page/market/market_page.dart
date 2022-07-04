import 'package:assistantflutter/jin10/widget/jin10_main_head.dart';
import 'package:assistantflutter/model/bean/jin10/market_data.dart';
import 'package:assistantflutter/net/jin10/jin10_http_util.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme.dart';
import 'market_list_page.dart';

class MarketPage extends StatefulWidget {
  final bool hideAppBar;

  const MarketPage({Key key, this.hideAppBar = false}) : super(key: key);

  @override
  MarketPageState createState() => new MarketPageState();
}

class MarketPageState extends State<MarketPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  TabController _controller;
  int customIndex = 0;
  List<MarketRootData> data = List();


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,designSize: Size(375, 840), allowFontScaling: false);
    return Scaffold(
      appBar: widget.hideAppBar ? null : Jin10MainHead(),
      body: DefaultTabController(
        length: data.length,
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Container(
              color: AppTheme.white,
              child: Column(
                children: [
                  Container(
                    height: 3.h,
                    margin: EdgeInsets.only(top: 2.h),
                    color: AppTheme.white,
                  ),
                  Container(
                    color: Theme.of(context).appBarTheme.color,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 45.h,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TabBar(
                                isScrollable: true,
                                controller: _controller,
                                indicator: BubbleTabIndicator(
                                  indicatorHeight: 20.h,
                                  indicatorColor: AppTheme.white,
                                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 2.h),
                                  indicatorRadius: 20.h,
                                ),
                                unselectedLabelColor: Theme.of(context).textTheme.subtitle1.color,
                                labelColor: AppTheme.nearlyBlue,
                                tabs: data.map((e) => Tab(text: e.cateName)).toList(),
                                unselectedLabelStyle: TextStyle(fontSize: 16.sp),
                                labelStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        // SizedBox(width: 20.w,),
                        SizedBox(width: 5.w,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: List.generate(data.length, (index) => getListPage(data[index])),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget getListPage(MarketRootData data){
    return MarketListPage(marketRootData: data,);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Jin10HttpUtil().marketRootDataList;
    _controller = TabController(vsync: this,
        length: data.length, initialIndex: customIndex)
      ..addListener(() {
        setState(() {
          customIndex = _controller.index;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(MarketPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}