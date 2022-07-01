import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';

class CalenderModel extends ChangeNotifier{
  String startTime;
  String endTime;

  CalenderModel(){
    if(ObjectUtil.isEmptyString(startTime) || ObjectUtil.isEmptyString(endTime)){
      startTime = DateUtil.formatDate(DateTime.now(),format:DateFormats.y_mo_d);
      endTime = DateUtil.formatDate(DateTime.now(),format:DateFormats.y_mo_d);
    }
  }
  saveData(String sTime,String eTime) {
    startTime = sTime;
    endTime = eTime;
    notifyListeners();
  }
  clearDate() {
    startTime = "";
    endTime = "";
    notifyListeners();
  }
}