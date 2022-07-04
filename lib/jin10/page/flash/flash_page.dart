import 'package:assistantflutter/jin10/model/nav/nav_model.dart';
import 'package:assistantflutter/jin10/widget/jin10_main_head.dart';
import 'package:assistantflutter/model/bean/jin10/nav_tab_data.dart';
import 'package:assistantflutter/widgets/statepage/view_state_widget.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme.dart';
import '../../../widgets/statepage/provider_widget.dart';
import 'flash_list_page.dart';

class FlashPage extends StatefulWidget {

 final bool hideAppBar;

  const FlashPage({Key key, this.hideAppBar = false}) : super(key: key);

  @override
  FlashPageState createState() => new FlashPageState();
}

class FlashPageState extends State<FlashPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  TabController _controller;
  int customIndex = 0;
  NavModel _model;

  @override
  Widget build(BuildContext context) {

    return ProviderWidget<NavModel> (
        autoDispose: false,
        model: NavModel(NavModel.type_flash),
        onModelReady: (model) => model.loadData(),
        builder: (context, model, child) {
          _model = model;
          if (model.isBusy) {
            return ViewStateBusyWidget();
          } else if (model.isError && model.navTabData == null) {
            return ViewStateErrorWidget(onPressed: model.loadData,error:  model.viewStateError,);
          } else if (model.isEmpty) {
            return ViewStateEmptyWidget(onPressed: model.loadData);
          }
          FlashTabData navTabData = model.navTabData;
          _controller = TabController(vsync: this,
              length: navTabData.data.length, initialIndex: customIndex)
            ..addListener(() {
              setState(() {
                customIndex = _controller.index;
                print(customIndex);
              });
            });
          return Scaffold(
            appBar: widget.hideAppBar ? null : Jin10MainHead(),
            body: DefaultTabController(
              length: navTabData.data.length,
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
                                      indicator: BubbleTabIndicator(
                                        indicatorHeight: 20.h,
                                        indicatorColor: AppTheme.white,
                                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                                        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 2.h),
                                        indicatorRadius: 20.h,
                                      ),
                                      unselectedLabelColor: Theme.of(context).textTheme.subtitle1.color,
                                      labelColor: AppTheme.nearlyBlue,
                                      controller: _controller,
                                      tabs: navTabData.data.map((e) => Tab(text: e.name)).toList(),
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
                            children: List.generate(navTabData.data.length, (index) => getListPage(navTabData.data[index])),
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          );
        }
    );

  }


  Widget getListPage(NavData data){
    return FlashListPage(navData: data,);
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _model.dispose();
  }

  @override
  void didUpdateWidget(FlashPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  bool get wantKeepAlive => true;
}