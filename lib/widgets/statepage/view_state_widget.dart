import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme.dart';
import '../load_image.dart';
import 'view_state.dart';

/// 加载中
class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Center(child: CircularProgressIndicator());
    return Center(
      child: Container(
        width: 90,
        height: 90,
        color: Color(0xCC000000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: AppTheme.white,
              size: 40,
            ),
            SizedBox(height: 5,),
            Text(
              "加载中...",
                style: TextStyle(
                  fontSize: 15,
                  color: AppTheme.white,
                )
            ),
          ],
        ),
      ),
    );
  }
}

/// 基础Widget
class ViewStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget image;
  final Widget buttonText;
  final String buttonTextData;
  final VoidCallback onPressed;

  ViewStateWidget(
      {Key key,
      this.image,
      this.title,
      this.message,
      this.buttonText,
      @required this.onPressed,
      this.buttonTextData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        image ?? Icon(IconFonts.pageError, size: 80.w, color: Colors.grey[500]),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title ?? "加载失败",
                style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              // ConstrainedBox(
              //   constraints: BoxConstraints(maxHeight: 200, minHeight: 150),
              //   child: SingleChildScrollView(
              //     child: Text(message ?? '', style: Theme.of(context).textTheme.bodyText2),
              //   ),
              // ),
            ],
          ),
        ),
        Center(
          child: ViewStateButton(
            child: buttonText,
            textData: buttonTextData,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}

/// ErrorWidget
class ViewStateErrorWidget extends StatelessWidget {
  final ViewStateError error;
  final String title;
  final String message;
  final Widget image;
  final Widget buttonText;
  final String buttonTextData;
  final VoidCallback onPressed;

  const ViewStateErrorWidget({
    Key key,
    @required this.error,
    this.image,
    this.title,
    this.message,
    this.buttonText,
    this.buttonTextData,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultImage;
    var defaultTitle;
    var errorMessage = error.message;
    String defaultTextData = "重试";
    switch (error.errorType) {
      case ViewStateErrorType.networkTimeOutError:
        defaultImage = const LoadAssetImage("common/empty",width: 80,height: 80);
        defaultTitle = "网络连接异常,请检查网络或稍后重试";
        // errorMessage = ''; // 网络异常移除message提示
        break;
      case ViewStateErrorType.defaultError:
        defaultImage = const LoadAssetImage("common/loaderr",width: 80,height: 80);
        defaultTitle = "加载失败";
        break;

      case ViewStateErrorType.unauthorizedError:
        return ViewStateUnAuthWidget(
          image: image,
          message: message,
          buttonText: buttonText,
          onPressed: onPressed,
        );
    }

    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ?? defaultImage,
      title: title ?? defaultTitle,
      message: message ?? errorMessage,
      buttonTextData: buttonTextData ?? defaultTextData,
      buttonText: buttonText,
    );
  }
}


/// 页面无数据
class ViewStateEmptyWidget extends StatelessWidget {
  final String message;
  final Widget image;
  final Widget buttonText;
  final VoidCallback onPressed;

  const ViewStateEmptyWidget(
      {Key key,
      this.image,
      this.message,
      this.buttonText,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ?? LoadAssetImage("common/empty",width: 76.w,height: 71.h),
      title: message ?? "暂无数据",
      buttonText: buttonText,
      buttonTextData: "刷新一下",
    );
  }
}


/// 页面未授权
class ViewStateUnAuthWidget extends StatelessWidget {
  final String message;
  final Widget image;
  final Widget buttonText;
  final VoidCallback onPressed;

  const ViewStateUnAuthWidget(
      {Key key,
        this.image,
        this.message,
        this.buttonText,
        @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: this.onPressed,
      // image: image ?? ViewStateUnAuthImage(),
      image: image ?? LoadAssetImage("common/empty",width: 76.w,height: 71.h),
      title: message ?? "未登录",
      buttonText: buttonText,
      buttonTextData: "登录",
    );
  }
}

/// 未授权图片
class ViewStateUnAuthImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Hero(
    //   tag: 'loginLogo',
    //   child: Image.asset(
    //     "assets/images/tabs/tab_my_nor.png",
    //     width: 130,
    //     height: 100,
    //     fit: BoxFit.fitWidth,
    //     color: Theme.of(context).accentColor,
    //     colorBlendMode: BlendMode.srcIn,
    //   ),
    // );
    return Image.asset(
      "assets/images/empty.png",
      // width: 130,
      height: 100,
      fit: BoxFit.fitWidth,
      color: Theme.of(context).accentColor,
      colorBlendMode: BlendMode.srcIn,
    );
  }
}

/// 公用Button
class ViewStateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String textData;

  const ViewStateButton({@required this.onPressed, this.child, this.textData})
      : assert(child == null || textData == null);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: child ??
          Text(
            textData ?? "重试",
            style: TextStyle(wordSpacing: 5),
          ),
      onPressed: onPressed,
    );
  }
}
