
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'common_router.dart';
import 'i_router.dart';
import 'not_found_page.dart';

class Routes {
  static String home = '/home';
  static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String, List<String>> params) {
        debugPrint('未找到目标页');
        return NotFoundPage();
      }
    );
    //
    // router.define(home, handler: Handler(
    //     handlerFunc: (BuildContext context, Map<String, List<String>> params) => NavigationHomeScreen()));


    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(CommonRouter());
    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}