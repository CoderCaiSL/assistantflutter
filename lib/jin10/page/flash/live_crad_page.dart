
import 'package:common_utils/common_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:assistantflutter/app_theme.dart';
import 'package:assistantflutter/base/base_widget_state.dart';
import 'package:assistantflutter/model/bean/jin10/jin10_flash_data.dart';
import 'package:assistantflutter/util/common_date_utils.dart';
import 'package:assistantflutter/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assistantflutter/widgets/load_image.dart';

class LiveCardPage extends StatefulWidget {
  final FlashItem flashItem;

  const LiveCardPage({Key key, this.flashItem}) : super(key: key);
  @override
  LiveCardPageState createState() => new LiveCardPageState();
}

class LiveCardPageState extends BaseWidgetState<LiveCardPage> {
  FlashItem _flashItem;

  @override
  Widget build(BuildContext context) {
    _flashItem = widget.flashItem;
    return Scaffold(
      appBar: CommonAppBar(title: setTitleName(),isBack: true),
      body: setContentView(),
      resizeToAvoidBottomInset: defaultTargetPlatform != TargetPlatform.iOS,
    );
    return setContentView();
  }

  @override
  Widget setContentView() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.all(10.w),
            child: Container(
              margin: EdgeInsets.all(20.w),
              color: AppTheme.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        LoadAssetImage('jin10/flash_header',width: 150.w,),
                        Expanded(child: Container(
                          alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(CommonDateUtils.getTimeStr(_flashItem.time, 'yyyy/MM'),style: TextStyle(
                                  fontSize: 12.sp,color: AppTheme.nearlyBlue
                                ),),
                                Text(CommonDateUtils.getTimeStr(_flashItem.time, 'dd'),style: TextStyle(
                                    fontSize: 22.sp,color: AppTheme.nearlyBlue,fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ))),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: Divider(height: 1.w,),flex: 1,),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('${CommonDateUtils.getWeek(_flashItem.time)} | ${CommonDateUtils.getTimeStr(_flashItem.time, 'HH:mm:ss')}',style: TextStyle(
                              fontSize: 12.sp,color: AppTheme.nearlyBlue,
                            ),),
                          ),
                          flex: 8,
                        ),
                        Expanded(child: Divider(height: 1.w,),flex: 1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  ObjectUtil.isEmptyString(_flashItem.data.title)?
                      SizedBox():
                      Text(_flashItem.data.title,style: AppTheme.title,),
                  ObjectUtil.isEmptyString(_flashItem.data.content)?
                  SizedBox():
                  Html(
                    data: _flashItem.data.content,
                  ),
                  getPicWidget(),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getPicWidget(){
    if (ObjectUtil.isEmptyString(_flashItem.data.pic)) {
      return SizedBox();
    }
    return Column(
      children: [
        SizedBox(height: 20.h,),
        LoadImage(_flashItem.data.pic,width: double.maxFinite,),
      ],
    );
  }

  @override
  String setTitleName() {
    // TODO: implement getTitleName
    return '快讯详情';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(LiveCardPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}