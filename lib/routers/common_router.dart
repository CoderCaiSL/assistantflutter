

import 'package:fluro/fluro.dart';

import 'i_router.dart';

class CommonRouter implements IRouterProvider{

  static String login = '/main/login';
  static String register = '/main/register';
  static String user = '/main/user';


  static String tourismMain = '/tourism/main';
  static String tourismMap = '/tourism/map';
  static String tourismMapAdd = '/tourism/map/add';

  static String healthMain = '/health/main';

  @override
  void initRouter(FluroRouter router) {
    //
    // router.define(login, handler: Handler(handlerFunc: (_, __) => LoginPage()));
    // router.define(register, handler: Handler(handlerFunc: (_, __) => RegisterPage()));
    // router.define(user, handler: Handler(handlerFunc: (_, __) => UserPage()));
    //
    // router.define(tourismMain, handler: Handler(handlerFunc: (_, __) => TourismMainPage()));
    // router.define(healthMain, handler: Handler(handlerFunc: (_, __) => FitnessAppHomeScreen()));
    // router.define(tourismMap, handler: Handler(handlerFunc: (_, __) => TourismMapPage()));
    // router.define(tourismMapAdd, handler: Handler(handlerFunc: (_, __) => TourismMapAddPage()));

  }


}