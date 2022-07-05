import 'dart:io';

import 'package:assistantflutter/jin10/page/flash/flash_page.dart';
import 'package:assistantflutter/jin10/page/jin10_home_page.dart';
import 'package:assistantflutter/jin10/page/market/market_page.dart';
import 'package:assistantflutter/jin10/page/vip/vip_page.dart';
import 'package:assistantflutter/util/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:sp_util/sp_util.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'jin10/page/calendar/calendar_page.dart';
import 'jin10/page/news/news_page.dart';
import 'provider/calendar_model.dart';
import 'provider/user_model.dart';
import 'routers/routers.dart';
import 'widgets/flutter_nav.dart';
import 'widgets/selectText.dart';

void main() async {
  runApp(const MyApp());
}

@pragma("vm:entry-point")
void jin10MainView() async {
  //加密方式初始化
  runApp(const MyApp());
}

@pragma("vm:entry-point")
void showCell() {
  runApp(MaterialApp(
    home: Text("测试"),
  ));
}

@pragma("vm:entry-point")
void showText(){
  runApp(
    MaterialApp(
    home: SelectText(
      isSelect: true,
      title: '参考',
      norImageStr:"jin10/news",
      selImageStr: "jin10/news_h",
    ),
  ));
}

@pragma("vm:entry-point")
void showHome(){
  runApp(MyApp2());
}

void showFlashPage(){
  runApp(MaterialApp(
    home: FlashPage(hideAppBar: true),
  ));
}
void showNewsPage(){
  runApp(MaterialApp(
    home: NewsPage(hideAppBar: true),
  ));
}

void showVipPage(){
  runApp(MaterialApp(
    home: VipPage(hideAppBar: true),
  ));
}

void showMarketPage(){
  runApp(MaterialApp(
    home: MarketPage(hideAppBar: true),
  ));
}
void showCalendarPage(){
  runApp(MaterialApp(
    home: CalendarPage(),
  ));
}

void showFlutterNavView(){
  runApp(FlutterView());
}


class MyApp2 extends StatelessWidget {
  const MyApp2({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Routes.initRoutes();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModel>(
          create: (context) => UserModel(),
        ),
        ChangeNotifierProvider<CalenderModel>(
          create: (context) => CalenderModel(),
        ),
      ],
      child: MaterialApp(
        // ignore: missing_return
        title: AppTheme.appTitle,
        debugShowCheckedModeBanner: false,
        builder:EasyLoading.init(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: AppTheme.textTheme,
          platform: TargetPlatform.iOS,
        ),
        home: Jin10HomePage()
      ),
    );
  }
}





class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
