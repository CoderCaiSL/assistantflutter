import 'package:assistantflutter/net/jin10/jin10_http_util.dart';
import 'package:assistantflutter/widgets/statepage/view_state_refresh_list_model.dart';
import 'package:assistantflutter/model/bean/jin10/calendar_data.dart';

class CalendarListModel  extends ViewStateRefreshListModel{
  String startTime;
  String endTime;
  String type;
  CalendarListModel(this.startTime, this.endTime,this.type);

  @override
  Future<List> loadData({int pageNum, int pageSize}) async {
    CalendarData calendarData;
    if('假期' == type){
      calendarData = await Jin10HttpUtil().getCalenderHolidayList(startTime, endTime);
    }else if('事件' == type){
      calendarData = await Jin10HttpUtil().getCalenderEventList(startTime, endTime);
    }else{
      calendarData = await Jin10HttpUtil().getCalenderList(startTime, endTime);
    }
    return calendarData.data;
  }

}