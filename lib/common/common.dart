import 'package:flutter/foundation.dart';

class Constant {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = kReleaseMode;

  static bool isDriverTest  = false;
  static bool isUnitTest  = false;
  static const String user = 'user';
  static const String assistantflutter = 'assistantflutter';

  static const String theme = 'theme';
  static const String iosMapKey = 'aeApUtw9zccZlPN0uWg31VrXZNZCbxD6';
  static const String bmobAppId = '8fd764e3fedb57cd15d5fd21600329f2';
  static const String bmobAppKey = '9c29937e8ad1a68935dc6735a9a4d01b';


}
