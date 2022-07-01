import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assistantflutter/util/theme_utils.dart';

import '../app_theme.dart';
import 'selectText.dart';

enum FriendPageTag {
  appointment, ///约单
  community, ///社区
  message,///消息
  mine,///我的
}

class FriendTabBar extends StatelessWidget {
  final Function(int) onTabSwitch;
  final Function() onAddButton;

  final bool hasBackground;
  final int current;

  const FriendTabBar({
    Key key,
    this.onTabSwitch,
    this.current,
    this.onAddButton,
    this.hasBackground: true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    Widget row = Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == 0,
              title: '快讯',
              norImageStr:"jin10/newsletter",
              selImageStr: "jin10/newsletter_h",
            ),
            onTap: () => onTabSwitch?.call(0),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == 1,
              title: '参考',
              norImageStr:"jin10/news",
              selImageStr: "jin10/news_h",
            ),
            onTap: () => onTabSwitch?.call(1),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == 2,
              title: '会员',
              norImageStr:"jin10/vip",
              selImageStr: "jin10/vip_h",
            ),
            onTap: () => onTabSwitch?.call(2),
          ),
        ),
        /*Expanded(
          child: GestureDetector(
            // child: Icon(
            //   Icons.add_box,
            //   size: 32,
            // ),
            child: Container(
              alignment: Alignment.center,
              // color: Colours.text_white,
              child: Container(
                height: 34.h,
                width: 46.w,
                // color: Colours.text_red,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppTheme.text_red,
                ),
                child: Icon(
                  Icons.add,
                  size: 30.w,
                  color: AppTheme.bg_white,
                ),
              ),
            ),
            onTap: () => onAddButton?.call(),
          ),
        ),*/
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == 3,
              title: '行情',
              norImageStr:"jin10/market",
              selImageStr: "jin10/market_h",
            ),
            onTap: () => onTabSwitch?.call(3),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == 4,
              title: '日历',
              norImageStr:"jin10/calendar",
              selImageStr: "jin10/calendar_h",
            ),
            onTap: () => onTabSwitch?.call(4),
          ),
        ),
      ],
    );
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.color,
          border: Border(top:BorderSide(width: 1,color: ThemeUtils.isDark(context)?AppTheme.dark_line : AppTheme.line))
      ),
      child: Container(
        padding: EdgeInsets.only(bottom: padding.bottom),
        height: 55.h + padding.bottom,
        child: row,
      ),
    );
  }
}
