import 'package:flutter/material.dart';
import 'package:assistantflutter/app_theme.dart';
import 'package:assistantflutter/model/bean/jin10/market_data.dart';
import 'package:assistantflutter/net/jin10/jin10_http_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketListPage extends StatefulWidget {
  final MarketRootData marketRootData;

  const MarketListPage({Key key, this.marketRootData}) : super(key: key);
  @override
  MarketListPageState createState() => new MarketListPageState();
}

class MarketListPageState extends State<MarketListPage> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin   {

  List<MarketDetailItem> topList = List();
  List<MarketCateItem> cateItemList = List();
  @override
  Widget build(BuildContext context) {
    topList = widget.marketRootData.commends;
    cateItemList = widget.marketRootData.cates;
    return CustomScrollView(
        slivers: buiSlivers());
  }

  buiSlivers(){
    List<Widget> widgetList = new List();
    Widget grid =  SliverPadding(
      padding: const EdgeInsets.all(5.0),
      sliver: new SliverGrid( //Grid
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //Grid按两列显示
          //主轴间隔
          mainAxisSpacing: 0.0,
          //横轴间隔
          crossAxisSpacing: 0.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            //创建子widget
            return getItemWidget(topList[index]);
          },
          childCount: topList.length,
        ),
      ),
    );
    widgetList.add(grid);
    Widget sliverToBox =  SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: <Widget>[
            Divider(height: 20.h,)
          ],
        ),
      ),
    );
    widgetList.add(sliverToBox);
    widgetList.addAll(buildSliverList());
    return widgetList;
  }

   buildSliverList(){
    List<Widget> widgetList = new List();
    for (MarketCateItem tmp in cateItemList) {
      Widget tmpW =  SliverList(
        delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return getListViewItem(tmp.subItems[index]);
            },
            childCount: tmp.subItems.length < 5 ? tmp.subItems.length : 5,
        ),
      );
      widgetList.add(tmpW);
    }
    return widgetList;
  }

  Widget getListViewItem(MarketDetailItem item) {
    double yesterday_close = item.close;
    double current_prices = item.prices;
    double today_open = item.open;
    double gains = item.gains;
    //String current_prices_str = current_prices.toStringAsFixed(2);
    String current_prices_str = current_prices.toString();
    return new GestureDetector(
      child: new Container(
        child: new Padding(
          padding: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //纵向对齐方式：起始边对齐
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(left: 5.w),
                        child: new Text(
                          item.name,
                          style: AppTheme.jin10ListTitle,
                          maxLines: 1,
                        ),
                        alignment: FractionalOffset.topLeft,
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: 5.w),
                        child: new Text(
                          item.code,
                          style: new TextStyle(
                              fontSize: 12.0, color: Colors.black38),
                        ),
                        alignment: FractionalOffset.bottomLeft,
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              new Expanded(
                child: new Container(
                  child: new Text(
                    current_prices_str,
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  alignment: FractionalOffset.center,
                ),
                flex: 2,
              ),
              new Expanded(
                child: ShowGains(gains),
                flex: 1,
              )
            ],
          ),
        ),
      ),
      onTap: () {

      },
    );
  }
  ShowGains(double gains) {
    Color show_color;
    String gains_str = (gains * 100).toStringAsFixed(2) + "%";
    if (gains > 0) {
      show_color = Colors.red;
      gains_str = "+" + gains_str;
    } else if (gains < 0) {
      show_color = Colors.green;
    } else {
      show_color = Colors.black38;
    }
    return new Container(
      color: show_color,
      padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: new Text(
        gains_str,
        style: new TextStyle(fontSize: 12.0, color: Colors.white),
      ),
      alignment: FractionalOffset.center,
    );
  }

  getGistView() {
    return new GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      padding:  EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0),
      //主轴间隔
      mainAxisSpacing: 0.0,
      //横轴间隔
      crossAxisSpacing: 0.0,
      children: buildGridList(),
    );
  }

  buildGridList() {
    List<Widget> widgetList = new List();
    for (MarketDetailItem tmp in topList) {
      widgetList.add(getItemWidget(tmp));
    }
    return widgetList;
  }

  Widget getItemWidget(MarketDetailItem data) {
    Color show_color;
    String gains_rate = data.strPer;
    if (gains_rate == "0.00") {
      show_color = Colors.black38;
    } else {
      if (gains_rate.indexOf("-") == -1) {
        show_color = Colors.red;
      } else {
        show_color = Colors.green;
      }
    }
    return new GestureDetector(
      child:  SizedBox(
        height: 100.h,
        child: Card(
          child:  Container(
            height: 100.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/jin10/res_market_red.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Text(
                    data.name,
                    style: new TextStyle(fontSize: 16.sp, color: Colors.black),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ) ,
                ),
                Expanded(
                  child:new Text(
                    data.strLatest,
                    style: new TextStyle(fontSize: 16.sp, color: show_color),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ) ,
                ),
                Expanded(
                  child: Container(
                    padding: new EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child:Text(
                              data.strAmount,
                              style: new TextStyle(fontSize: 11.sp, color: AppTheme.text_gray),
                              maxLines: 1,
                            ),
                            alignment: FractionalOffset.centerLeft,
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            child:Text(
                              data.strPer,
                              style: new TextStyle(fontSize: 11.sp, color: show_color),
                              maxLines: 1,
                            ),
                            alignment: FractionalOffset.centerRight,
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ) ,
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ),onTap: (){
      onItimeClick(data);
    },
    );
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
  void didUpdateWidget(MarketListPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void onItimeClick(MarketDetailItem data) {

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}