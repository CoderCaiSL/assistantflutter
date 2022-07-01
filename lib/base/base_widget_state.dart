import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tourism/widgets/common_appbar.dart';

import '../app_theme.dart';

class BaseWidgetState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {

  Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar(title: setTitleName(),isBack: true),
      body: Stack(children: <Widget>[
        Column(
          children: [
            setContentView(),
          ],
        ),
      ]),
        resizeToAvoidBottomInset: defaultTargetPlatform != TargetPlatform.iOS,
    );
  }

  /// 内容区域
  Widget setContentView() {
    throw UnimplementedError();
  }


  String setTitleName(){
    return "";
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    if (state == AppLifecycleState.resumed) {
      //on resume
      onResume();
    } else if (state == AppLifecycleState.paused) {
      //on pause
      onPause();
    }
    super.didChangeAppLifecycleState(state);
  }

  void onResume() {}

  void onPause() {}

}
