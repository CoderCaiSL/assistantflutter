import 'package:common_utils/common_utils.dart';

class CommonDateUtils{
  static String mo = 'MM';
  static String day = 'dd';


  static String getMothAndDay(String time){
    DateTime date = DateTime.parse(time);
    return DateUtil.formatDate(date,format: DateFormats.mo_d);
  }
  static String getMoth(String time){
    DateTime date = DateTime.parse(time);
    return DateUtil.formatDate(date,format: mo);
  }

  static String getDay(String time){
    DateTime date = DateTime.parse(time);
    return DateUtil.formatDate(date,format: day);
  }

  static bool isSameDay(String time1,String time2){
    DateTime date1 = DateTime.parse(time1);
    DateTime date2 = DateTime.parse(time2);
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  static String getTimeStr(String time,String format){
    DateTime date = DateTime.parse(time);
    return DateUtil.formatDate(date,format: format);
  }

  static String getWeek(String time){
    DateTime date = DateTime.parse(time);
    return DateUtil.getWeekday(date,languageCode: 'zh',);
  }

  static String getWeekZ(String time){
    DateTime date = DateTime.parse(time);
    return DateUtil.getWeekday(date,languageCode: 'zh',short: true);
  }
}