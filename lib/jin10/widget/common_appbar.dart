import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../app_theme.dart';



class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const   CommonAppBar(
      {Key key,
      this.title,
      this.titleStyle,
      this.backgroundColor,
      this.isBack: true,
      this.onBack,
      this.actions,
      this.bottom})
      : super(key: key);

  /// 标题
  final String title;

  /// 标题Style
  final TextStyle titleStyle;

  /// 背景色
  final Color backgroundColor;

  /// 是否展示返回按钮
  final bool isBack;

  /// 返回按钮点击回调
  final VoidCallback onBack;

  /// actions
  final List<Widget> actions;

  /// 底部widget
  final PreferredSizeWidget bottom;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? 'title',
        style: titleStyle ?? AppTheme.TextAppBarTitle
      ),
      leading: isBack
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: AppTheme.text_title,
              onPressed: onBack != null ? onBack : () {onBackDefault(context);})
          : null,
      actions: actions,
      backgroundColor:
          backgroundColor ?? Color(AppTheme.white.value),
      elevation: 0,
      bottom: CommonAppBarBottom(child: bottom),
    );
  }

  void onBackDefault(BuildContext context) => Navigator.pop(context);

  static Widget getRightText({String content,VoidCallback callBack}){
    return Container(
      padding: EdgeInsets.only(right: 10),
      height: AppBar().preferredSize.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(32.0),
              ),
              onTap:callBack,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(content,style: AppTheme.TextAppBarRight,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommonAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBarBottom({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          width: double.infinity,
          height: 0,
          color: Colors.white,
        ),
        child ?? SizedBox(height: 0),
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(this.child != null ? 47 : 1);
}
