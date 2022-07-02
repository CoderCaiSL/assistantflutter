import 'package:assistantflutter/net/jin10/jin10_http_util.dart';
import 'package:assistantflutter/provider/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/friend_tabbar.dart';
import 'calendar/calendar_page.dart';
import 'flash/flash_page.dart';
import 'market/market_page.dart';
import 'news/news_page.dart';
import 'vip/vip_page.dart';

class Jin10HomePage extends StatefulWidget {
  @override
  Jin10HomePageState createState() => new Jin10HomePageState();

}

class Jin10HomePageState extends State<Jin10HomePage> {
  int _currentIndex = 0;
  List<Widget> _pages;
  UserModel _userModel;
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,designSize: Size(375, 840), allowFontScaling: false);
    _userModel = Provider.of<UserModel>(context, listen: true);
    Jin10HttpUtil().getAllMarketListNet();
    Widget friendTabBar = FriendTabBar(
      current: _currentIndex,
      onTabSwitch: (index) {
        _pageController.jumpToPage(index);
      },
      onAddButton: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     fullscreenDialog: true,
        //     settings: RouteSettings(name: "publishAppointmentPage"),
        //     builder: (context) => LocalNotificationWidget(),
        //   ),
        // );
      },
    );
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: _pageChanged,
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index]),
      bottomNavigationBar: friendTabBar,
    );
  }
  void _pageChanged(int index) {
    setState(() {
      if (_currentIndex != index) _currentIndex = index;
    });
  }
  @override
  void initState() {
    _pages = [
      new FlashPage(),
      new NewsPage(),
      new VipPage(),
      new MarketPage(),
      new CalendarPage(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  void didUpdateWidget(Jin10HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

