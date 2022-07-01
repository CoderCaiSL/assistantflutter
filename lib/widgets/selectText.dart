import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme.dart';
import 'load_image.dart';

class SelectText extends StatelessWidget {
  const SelectText({
    Key key,
    this.isSelect: true,
    this.title,
    this.norImageStr,
    this.selImageStr,
  }) : super(key: key);

  final bool isSelect;
  final String title;
  final String norImageStr;
  final String selImageStr;
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context);
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 12),
      // color: Colors.black.withOpacity(0),
      width: 60.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height:3.h),
          LoadAssetImage(
            isSelect ? selImageStr : norImageStr,
            height: 20.w,
          ),
          Text(
            title ?? '',
            textAlign: TextAlign.center,
            style:TextStyle(
              color: isSelect ? AppTheme.nearlyBlue : AppTheme.text_light_gray,
              fontSize: 12.sp
            )
          ),
          SizedBox(height:1.h),
        ],
      ),
    );
  }
}
