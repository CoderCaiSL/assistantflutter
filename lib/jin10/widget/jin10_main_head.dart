import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:assistantflutter/provider/user_model.dart';
import 'package:assistantflutter/routers/fluro_navigator.dart';
import 'package:assistantflutter/util/image_utils.dart';
import 'package:assistantflutter/widgets/load_image.dart';

import '../../app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routers/common_router.dart';

class Jin10MainHead extends StatefulWidget implements PreferredSizeWidget {

  /// 底部widget
  final PreferredSizeWidget bottom;

  const Jin10MainHead({Key key, this.bottom}) : super(key: key);

  @override
  Jin10MainHeadState createState() => new Jin10MainHeadState();

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}

class Jin10MainHeadState extends State<Jin10MainHead> {
  List<String> treeList = ["现货黄金","比特币","原油","区块链"];
  UserModel _userModel;

  @override
  Widget build(BuildContext context) {
    _userModel = Provider.of<UserModel>(context, listen: true);
    return AppBar(
      primary: true,//为false的时候会影响leading，actions、titile组件，导致向上偏移
      actionsIconTheme: IconThemeData(color: Colors.blue,opacity: 0.6),//设置导航右边图标的主题色，此时iconTheme对于右边图标颜色会失效
      iconTheme: IconThemeData(color: Colors.black,opacity: 0.6),//设置AppBar上面Icon的主题颜色
      brightness: Brightness.light,//设置导航条上面的状态栏显示字体颜色
      backgroundColor: AppTheme.white,//设置背景颜色
      centerTitle: true,
      titleSpacing: 5,
      elevation: 0,///去除底部阴影
      title: Container(
        height: 32.h,
        decoration: new BoxDecoration(
          //背景
          color: AppTheme.input_bg_color,
          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          //设置四周边框
          border: new Border.all(width: 1, color: AppTheme.input_bg_color),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
              Container(
                  padding: EdgeInsets.only(left: 10.w),
                  child: getTextItem('比特币'))
            /*Center(
              child: Container(
                padding: EdgeInsets.only(left: 10.w),
                width: 100,
                alignment: Alignment.centerLeft,
                child: FontMarquee(
                  detialWidget: getTextList(treeList)),
              ),
            ),*/
          ],),
      ),
      leading: Container(
        padding: EdgeInsets.only(left: 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          child: InkWell(
              child: Image.asset('assets/images/user.png',),
                  onTap: () {
                    if(_userModel.hasUser){
                      NavigatorUtils.push(context, CommonRouter.user);
                    }else{
                      NavigatorUtils.push(context, CommonRouter.login);
                    }
                  },
          ),
        ),
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 20.w,left: 10.w),
          child: Row(
            children: [
/*              InkWell(
                  onTap: () {

                  },
                  child: Container(
                      width: 40.w,
                      height: 40.h,
                      child: LoadAssetImage('jin10/gif_vip_elite',format: ImageFormat.webp,))),*/
              InkWell(
                  onTap: () {

                  },
                  child: Container(
                      width: 40.w,
                      height: 40.h,
                      child: LoadAssetImage('jin10/notify_tv',format: ImageFormat.webp,))),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> getTextList(List<String> treeList){
    return treeList.map((item) => getTextItem(item)).toList();
  }
  Widget getTextItem(String text){
    return Container(
        child: Text(text,style: AppTheme.jin10Search,));
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
  void didUpdateWidget(Jin10MainHead oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}