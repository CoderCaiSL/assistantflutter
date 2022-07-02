import 'package:assistantflutter/widgets/load_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme.dart';
import '../../../util/event_bus.dart';
import 'calender_content_page.dart';

class CalendarPage extends StatefulWidget {
  @override
  CalendarPageState createState() => new CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  List<DateTime> timeTabList = List();
  TabController _controller;
  int customIndex = 15;
  String startTime = DateUtil.formatDate(DateTime.now(),format:DateFormats.y_mo_d);
  String endTime = DateUtil.formatDate(DateTime.now(),format:DateFormats.y_mo_d);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: new Scaffold(
        backgroundColor: AppTheme.bg_white,
        appBar: AppBar(
          leading: Text(''),
          backgroundColor: AppTheme.bg_white,
          elevation: 0, //去掉Appbar底部阴影
          title: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.w,
            indicatorColor: AppTheme.nearlyBlue,
            unselectedLabelColor: Theme.of(context).textTheme.subtitle1.color,
            labelColor: AppTheme.nearlyBlue,
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
            ),
            tabs: <Widget>[
              Tab(text: '数据'),
              Tab(text: '事件'),
              Tab(text: '假期')
            ],
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 10.w,left: 10.w,top: 10.h,bottom: 10.h),
              child: GestureDetector(
                child: IntrinsicHeight(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LoadAssetImage(
                        "jin10/cur_month_bg",
                        width: 30.w,
                        height: 30.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 5.h),
                        child: Text(DateUtil.formatDate(DateTime.now(),format: 'MM'),style: TextStyle(
                          fontSize: 9.sp,
                          color: AppTheme.nearlyBlue
                        ),),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  showDemoDialog(context: context);
                },
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: AppTheme.jin10riBg,
              alignment: Alignment.center,
              child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 1.w,
                  indicatorColor: AppTheme.white,
                  unselectedLabelColor: AppTheme.nearlyBlue,
                  labelColor: AppTheme.darkText,
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                  ),
                  controller: _controller,
                  tabs: timeTabList.map((e) => getTopItem(e)).toList()),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  CalenderContentPage(startTime: startTime,endTime: endTime,type: '数据',),
                  CalenderContentPage(startTime: startTime,endTime: endTime,type: '事件',),
                  CalenderContentPage(startTime: startTime,endTime: endTime,type: '假期',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void showDemoDialog({BuildContext context}) {
    // DateTime startDate = DateTime.now();
    // DateTime endDate = DateTime.now().add(const Duration(days: 5));
    // showDialog<dynamic>(
    //   context: context,
    //   builder: (BuildContext context) => CalendarPopupView(
    //     barrierDismissible: true,
    //     minimumDate: DateTime.now(),
    //     //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
    //     initialEndDate: endDate,
    //     initialStartDate: startDate,
    //     onApplyClick: (DateTime startData, DateTime endData) {
    //       setState(() {
    //         if (startData != null && endData != null) {
    //           startDate = startData;
    //           endDate = endData;
    //         }
    //       });
    //     },
    //     onCancelClick: () {},
    //   ),
    // );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeTabList.clear();
    for(int i = 15;i > 0;i--){
      DateTime tmp = DateTime.now().subtract(Duration(days: i));
      timeTabList.add(tmp);
    }
    timeTabList.add(DateTime.now());
    for(int i = 1;i <= 15;i++){
      DateTime tmp = DateTime.now().add(Duration(days: i));
      timeTabList.add(tmp);
    }
    _controller = TabController(vsync: this,
        length: timeTabList.length, initialIndex: customIndex)
      ..addListener(() {
        if(_controller.index ==_controller.animation.value) {
          setState(() {
            customIndex = _controller.index;
            startTime = DateUtil.formatDate(timeTabList[customIndex],format:DateFormats.y_mo_d);
            endTime = DateUtil.formatDate(timeTabList[customIndex],format:DateFormats.y_mo_d);
            EventBus.instance.commit(EventKeys.RefreshCalenderPage, {});
          });
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  void didUpdateWidget(CalendarPage oldWidget) {
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

  Widget getTopItem(DateTime e) {
    int index = timeTabList.indexOf(e);
    Color textColor = index == customIndex ? AppTheme.white : AppTheme.nearlyBlue;
   return
     Tab(child:
     Container(
       height:52.h,
       decoration: index == customIndex ? new BoxDecoration(
         color: AppTheme.nearlyBlue,
         //设置四周圆角 角度
         borderRadius: BorderRadius.all(Radius.circular(4.0)),
       ):null,
       child: Padding(
         padding: EdgeInsets.only(left: 8.w,right: 8.w),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.max,
           children: [
             Text(
               DateUtil.getWeekday(e,languageCode: 'zh',short: true),
               style: TextStyle(fontSize: 10.sp,color: textColor),
             ),
             SizedBox(height: 5.h,),
             Text(DateUtil.formatDate(e,format: 'dd'),
                 style: TextStyle(fontSize: 13.sp,color: textColor)),
           ],
         ),
       ),
     )
       ,);
  }
}