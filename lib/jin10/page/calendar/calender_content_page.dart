import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:assistantflutter/jin10/model/calendar/calendar_list_model.dart';
import 'package:assistantflutter/model/bean/jin10/calendar_data.dart';
import 'package:assistantflutter/provider/calendar_model.dart';
import 'package:assistantflutter/util/app_navigator.dart';
import 'package:assistantflutter/util/common_date_utils.dart';
import 'package:assistantflutter/util/event_bus.dart';
import 'package:assistantflutter/widgets/load_image.dart';
import 'package:assistantflutter/widgets/statepage/provider_widget.dart';
import 'package:assistantflutter/widgets/statepage/view_state_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme.dart';
import '../../../web_page.dart';

class CalenderContentPage extends StatefulWidget {
  String startTime;
  String endTime ;
  String type;
  CalenderContentPage({Key key, this.startTime, this.endTime,this.type,}) : super(key: key);
  @override
  CalenderContentPageState createState() => new CalenderContentPageState();
}

class CalenderContentPageState extends State<CalenderContentPage>  with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  CalenderModel _calenderModel;
  CalendarListModel _model;
  String startTime = DateUtil.formatDate(DateTime.now(),format:DateFormats.y_mo_d);
  String endTime = DateUtil.formatDate(DateTime.now(),format:DateFormats.y_mo_d);
  String type ;
  @override
  Widget build(BuildContext context) {
    type =  widget.type;
    //_calenderModel = Provider.of<CalenderModel>(context, listen: true);
    if(!ObjectUtil.isEmptyString(widget.startTime)){
      startTime = widget.startTime;
    }
    if(!ObjectUtil.isEmptyString(widget.endTime)){
      endTime = widget.endTime;
    }
    if(ObjectUtil.isEmpty(_model)){
      _model = CalendarListModel(startTime,endTime,type);
    }else{
      _model.startTime = startTime;
      _model.endTime = endTime;
      _model.type = type;
    }
    return ProviderWidget<CalendarListModel> (
      autoDispose: false,
      model: _model,
      onModelReady: (model) => model.initData(),
      builder: (context, model, child) {
        _model = model;
        if (model.isBusy) {
          return ViewStateBusyWidget();
        } else if (model.isError && model.list.isEmpty) {
          return ViewStateErrorWidget(onPressed: model.initData,error:  model.viewStateError,);
        } else if (model.isEmpty) {
          return ViewStateEmptyWidget(onPressed: model.initData);
        }
        return  SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: WaterDropHeader(
            complete: Text("刷新成功"),
            failed: Text("刷新失败"),),
          footer: CustomFooter(
            builder: (BuildContext context,LoadStatus mode){
              Widget body ;
              if(mode==LoadStatus.idle){
                body =  Text("拉起加载更多");
              }
              else if(mode==LoadStatus.loading){
                body =  CupertinoActivityIndicator();
              }
              else if(mode == LoadStatus.failed){
                body = Text("刷新失败，请重新尝试");
              }
              else if(mode == LoadStatus.canLoading){
                body = Text("释放以加载更多");
              } else{
                body = Text("没更多数据");
              }
              return Container(
                height: 55.0,
                child: Center(child:body),
              );
            },
          ),
          controller: model.refreshController,
          onRefresh: model.refresh,
          onLoading: model.loadMore,
          child: getList(),
        );
      },
    );
  }


  Widget getList(){
    print('测试数据更新${_model.list.length}');
   return ListView.builder(
      itemCount: _model.list.length,
      itemBuilder: (c, i) => InkWell(
        onTap: (){
          _onItemClick(_model.list[i]);
        },
        child: _itemList(_model.list[i]),
      ),
    );
  }


  Widget _itemList(CalendarItem item){
    String previous = '--';
    String consensus = '--';
    String actual = '--';
    if(!ObjectUtil.isEmptyString(item.previous)){
      previous = item.previous;
      if('%' == item.unit){
        previous += item.unit;
      }
    }
    if(!ObjectUtil.isEmptyString(item.consensus)){
      consensus = item.consensus;
      if('%' == item.unit){
        consensus += item.unit;
      }
    }
    if(!ObjectUtil.isEmptyString(item.actual)){
      actual = item.actual;
      if('%' == item.unit){
        actual += item.unit;
      }
    }
    String content = "";
    String time = " ";
    if('数据' == type){
      content = item.country+item.timePeriod+item.indicatorName;
      if(!ObjectUtil.isEmptyString(item.unit) && '%' != item.unit){
        content += '(${item.unit})';
      }
      time += CommonDateUtils.getTimeStr(item.pubTime, DateFormats.h_m);
    }else if('事件' == type){
      content = item.eventContent;
      time += item.eventTime;
    }else{
      content = item.exchangeName+item.restNote;
      time += item.country+"/"+item.name+'('+item.date+')';
    }
    return Container(
      margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h,bottom: 10.h),
      color: AppTheme.bg_white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            LoadImage(item.flagUrl2x,width: 30.w,height: 20.h,),
            Expanded(child: Text(time)),
            '假期' == type ? SizedBox() :
            SmoothStarRating(
              allowHalfRating: false,
              starCount: 5,
              rating: double.parse(item.star.toString()),
              size: 20,
              defaultIconData: Icons.star_border_purple500_sharp,
              color: AppTheme.nearlyBlue,
              borderColor: AppTheme.grey,
            ),
          ],),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Text(content,style: AppTheme.jin10ListTitle,),
          ),
          '数据' == type ? Padding(
            padding: EdgeInsets.only(left: 8.w,top: 3.h,bottom: 3.h,right: 8.w),
            child: Row(
              children: [
                Expanded(
                  child: RichText(text: TextSpan(
                      text: '前值：',
                      style: TextStyle(
                        color: AppTheme.text_gray,
                        fontSize: 12.sp,
                      ),
                      children: [
                        TextSpan(text: previous,
                            style: TextStyle(
                              color: AppTheme.darkText,
                              fontSize: 12.sp,
                            )
                        )
                      ]
                  )),
                ),
                Expanded(
                  child: RichText(text: TextSpan(
                      text: '预期值：',
                      style: TextStyle(
                        color: AppTheme.text_gray,
                        fontSize: 12.sp,
                      ),
                      children: [
                        TextSpan(text: consensus,
                            style: TextStyle(
                              color: AppTheme.darkText,
                              fontSize: 12.sp,
                            )
                        )
                      ]
                  )),
                ),
                Expanded(
                  child: RichText(text: TextSpan(
                      text: '公布值：',
                      style: TextStyle(
                        color: AppTheme.text_gray,
                        fontSize: 12.sp,
                      ),
                      children: [
                        TextSpan(text: actual,
                            style: TextStyle(
                              color: AppTheme.darkText,
                              fontSize: 12.sp,
                            )
                        )
                      ]
                  )),
                ),
              ],
            ),
          ):SizedBox(),
          Divider(),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EventBus.instance.addListener(EventKeys.RefreshCalenderPage, (arg) {
      Timer(Duration(milliseconds: 10), () {
        if(_model == null){
          return;
        }
        if(_model.list.isEmpty){
          _model.refresh();
        }else{
          _model.refreshController.requestRefresh();
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(CalenderContentPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Function _onItemClick(CalendarItem item){
    if(!ObjectUtil.isEmptyString(item.detailUrl)){
      AppNavigator.push(context, WebPage(url: item.detailUrl));
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}