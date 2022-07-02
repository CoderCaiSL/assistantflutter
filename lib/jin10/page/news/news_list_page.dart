import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:assistantflutter/jin10/model/news/news_list_model.dart';
import 'package:assistantflutter/jin10/page/vip/video_detail_page.dart';
import 'package:assistantflutter/model/bean/jin10/jin10_news_data.dart';
import 'package:assistantflutter/model/bean/jin10/news_vip_tab_data.dart';
import 'package:assistantflutter/util/app_navigator.dart';
import 'package:assistantflutter/util/screen_utils.dart';
import 'package:assistantflutter/widgets/load_image.dart';
import 'package:assistantflutter/widgets/statepage/provider_widget.dart';
import 'package:assistantflutter/widgets/statepage/view_state_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme.dart';
import '../../../web_page.dart';

class NewsListPage extends StatefulWidget {
  final NewsVipTab navData;

  const NewsListPage({Key key, this.navData}) : super(key: key);

  @override
  NewsListPageState createState() => new NewsListPageState();
}

class NewsListPageState extends State<NewsListPage> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin  {

  NewsListModel _model;
  Animation<double> _animation10;
  AnimationController controller;


  @override
  Widget build(BuildContext context) {
    return ProviderWidget<NewsListModel> (
      autoDispose: false,
      model: NewsListModel(widget.navData),
      onModelReady: (model) => model.initData(),
      builder: (context, model, child) {
        _model = model;
        if (model.isBusy) {
          return ViewStateBusyWidget();
        } else if (model.isError && model.list.isEmpty) {
          return ViewStateErrorWidget(onPressed: model.initData,error:  model.viewStateError,);
        } else if (model.isEmpty) {
          return ViewStateEmptyWidget(onPressed: model.initData);
        }
        return  Container(
          color: AppTheme.jin10Bg,
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(
              complete: Text("刷新成功"),
              failed: Text("刷新失败"),),
            footer: CustomFooter(
              builder: (BuildContext context,LoadStatus mode){
                Widget body ;
                if(mode==LoadStatus.idle){
                  body =  Text("拉起加载更多");
                }
                else if(mode==LoadStatus.loading){
                  body =  CupertinoActivityIndicator();
                }
                else if(mode == LoadStatus.failed){
                  body = Text("刷新失败，请重新尝试");
                }
                else if(mode == LoadStatus.canLoading){
                  body = Text("释放以加载更多");
                } else{
                  body = Text("没更多数据");
                }
                return Container(
                  height: 55.0,
                  child: Center(child:body),
                );
              },
            ),
            controller: model.refreshController,
            onRefresh: model.refresh,
            onLoading: model.loadMore,
            child: _buildContent(model),
          ),
        );
      },
    );
  }
  Widget _buildDynamicCard(Slides slides) {
    return Card(
      elevation: 2.0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),  //设置圆角
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LoadImage(slides.cover_img??"",fit: BoxFit.fill, width: double.maxFinite,
                height:double.maxFinite,),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10.0,
              child: Text(
                slides.title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(fontSize: 14,color: AppTheme.textWhite),),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildContent(NewsListModel model) {
    return CustomScrollView(
        slivers: <Widget>[
      // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
      SliverToBoxAdapter(
        child: Container(
          child: Column(
            children: <Widget>[
              ObjectUtil.isEmpty(model.jin10newsData.data.slides)?
              SizedBox():
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio:353/179,
                  child: Swiper(
                      fade: 0.8,
                      autoplay: true,
                      viewportFraction: 0.9,
                      itemBuilder: (c, i) {
                        return _buildDynamicCard(model.jin10newsData.data.slides[i]);
                      },
                      itemCount: model.jin10newsData.data.slides.length),
                ),
              ),
              _getHotListForTopis(model.jin10newsData),
              SizedBox(height: 10.h,),
              _getHotListTopis(model.jin10newsData),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return _itemList(model.list[index]);
          },childCount: model.list.length
        ),
      )
    ]);
  }

  bool _canShowTopList(Jin10NewsData jin10newsData){
    if (ObjectUtil.isEmpty(jin10newsData.data.listForHot)) {
      return false;
    }
    if (ObjectUtil.isEmptyList(jin10newsData.data.listForHot)) {
      return false;
    }
    return true;
  }
  ///又热门专题衍生出的两个列表
  Widget _getHotListForTopis(Jin10NewsData jin10newsData){
    if (_canShowTopList(jin10newsData)) {
      return ListView.builder(
        physics: new NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: jin10newsData.data.listForHot.length,
        itemBuilder: (c, i) => _itemList(jin10newsData.data.listForHot[i]),
      );
    }else{
      return SizedBox();
    }
  }
  ///热门专题
  Widget _getHotListTopis(Jin10NewsData jin10newsData){
    if (ObjectUtil.isNotEmpty(jin10newsData.data.hot_topics) && !ObjectUtil.isEmptyList(jin10newsData.data.hot_topics.list)) {
      return Container(
        color: AppTheme.bg_white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 3.w,
                        height: 10.h,
                        decoration: new BoxDecoration(
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Text(jin10newsData.data.hot_topics.title,
                        style: AppTheme.body1,)
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Text(
                    '查看更多',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(fontSize: 12),),
                ),
              ],),
              Container(
                height: 120.h,
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: jin10newsData.data.hot_topics.list.length,
                  itemBuilder: (c, i) => _itemHotTopis(jin10newsData.data.hot_topics.list[i]),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget _itemHotTopis(HotTopicsData item){
    return InkWell(
      onTap: () {
        //点击
      },
      child:Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 140.h,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LoadImage(item.mobile_thumb??"",fit: BoxFit.fill, width: double.maxFinite,
                  height:91.h,),
              ),
              SizedBox(height: 5.h,),
              Expanded(
                child: Container(
                  child: Text(item.title,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _itemList(NewsItem item){
    String content = item.title;
    if (ObjectUtil.isEmptyString(content)) {
      content = '测试';
    }
    return InkWell(
      onTap: () {
        //点击
        _onItemClick(item);
      },
      child: Container(
        color: AppTheme.bg_white,
        child: _getItemChild(item),
      ),
    );
  }

  Widget _getItemChild(NewsItem item){
    if (item.getItemType() == NewsItem.TYPE_SINGLE_IMG) {
      return new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start, //纵向对齐方式：起始边对齐
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Expanded(
                  child: Container(
                    height: 80.0.h,
                    margin: new EdgeInsets.fromLTRB(5.0.w, 0.0, 10.0.w, 0.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          child: new Text(
                            item.title,
                            style: AppTheme.jin10ListTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: FractionalOffset.topLeft,
                        ),
                        new Expanded(
                          child: new Container(
                            margin:
                            new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.w),
                            child: new Stack(
                              children: <Widget>[
                                new Container(
                                  child: new Text(item.displayDatetime,
                                      style: new TextStyle(fontSize: 10.0)),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                ObjectUtil.isNotEmpty(item.source) ?
                                new Container(
                                  child: new Text(item.source,
                                      style: new TextStyle(fontSize: 10.0)),
                                  alignment: FractionalOffset.bottomRight,
                                ) : new SizedBox(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 4,
                ),
                new Expanded(
                  child: Container(
                    height: 80.0.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LoadImage(item.mobileThumbs[0]??"",fit: BoxFit.fill, width: double.maxFinite,
                        height:double.maxFinite,),
                    ),
                    alignment: FractionalOffset.center,
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),
          new Divider(height: 1,), //分割线
        ],
      );
    }else if (item.getItemType() == NewsItem.TYPE_NO_IMG) {
      return new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start, //纵向对齐方式：起始边对齐
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Expanded(
                  child: Container(
                    height: 80.0.h,
                    margin: new EdgeInsets.fromLTRB(5.0.w, 0.0, 10.0.w, 0.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          child: new Text(
                            item.title,
                            style: new TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: FractionalOffset.topLeft,
                        ),
                        new Expanded(
                          child: new Container(
                            margin:
                            new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.w),
                            child: new Stack(
                              children: <Widget>[
                                new Container(
                                  child: new Text(item.displayDatetime,
                                      style: new TextStyle(fontSize: 10.0)),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                ObjectUtil.isNotEmpty(item.source) ?
                                new Container(
                                  child: new Text(item.source,
                                      style: new TextStyle(fontSize: 10.0)),
                                  alignment: FractionalOffset.bottomRight,
                                ) : new SizedBox(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 4,
                ),
              ],
            ),
          ),
          new Divider(height: 1,), //分割线
        ],
      );
    }else if (item.getItemType() == NewsItem.TYPE_BIG_IMG) {
      String img = "";
      if (ObjectUtil.isNotEmpty(item.mobileThumbs)&& item.mobileThumbs.length > 1) {
        img = item.mobileThumbs[1];
      } else if (ObjectUtil.isNotEmpty(item.mobileThumbs)&& item.mobileThumbs.length > 0) {
        img = item.mobileThumbs[0];
      }
        return Column(
        children: [
          Stack(
            alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
            children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio:187/95, //横纵比 长宽比  3:2
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LoadImage(img,fit: BoxFit.fill,width: double.maxFinite,
                      height:double.maxFinite,),
                  ),
                ),
                alignment: FractionalOffset.center,
              ),
            ),
              LoadAssetImage("jin10/news_video_play_big",width: 60.w,height: 60.h,),
          ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w,right: 10.w,bottom: 10.w),
            child: new Container(
              child: new Text(
                item.title,
                style: AppTheme.jin10ListTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              alignment: FractionalOffset.topLeft,
            ),
          ),
          new Divider(height: 1,), //分割线
        ],
      );
    }
    else{
      return SizedBox(height: 0,);
    }
  }
  
  Function _onItemClick(NewsItem newsItem){
    if ("news" == newsItem.type) {
      if (ObjectUtil.isNotEmpty(newsItem.web_redirect_url)) {
        AppNavigator.push(context, WebPage(url: newsItem.web_redirect_url,));
      }  else if (ObjectUtil.isNotEmpty(newsItem.detailUrl)) {
        AppNavigator.push(context, WebPage(url: newsItem.detailUrl,));
      }
    } else if('video' == newsItem.type){
      //AppNavigator.push(context, VideoDetailPage(id: newsItem.id.toString(),));
    }
  }


  @override
  void initState() {
    controller = AnimationController(vsync: this);
    _animation10 = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.animateTo(1.0, duration: Duration(seconds: 3));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _model.dispose();
    controller.dispose();
  }

  @override
  void didUpdateWidget(NewsListPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}