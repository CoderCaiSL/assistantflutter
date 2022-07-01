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
import 'package:assistantflutter/web_page.dart';
import 'package:assistantflutter/widgets/load_image.dart';
import 'package:assistantflutter/widgets/statepage/provider_widget.dart';
import 'package:assistantflutter/widgets/statepage/view_state_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme.dart';

class VideosListPage extends StatefulWidget {
  final NewsVipTab navData;

  const VideosListPage({Key key, this.navData}) : super(key: key);

  @override
  VideosListPageState createState() => new VideosListPageState();
}

class VideosListPageState extends State<VideosListPage> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin  {

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
              _getHotListTopis(model.jin10newsData),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return _getVideoList(model.jin10newsData.data.categories[index]);
          },childCount: model.jin10newsData.data.categories.length
        ),
      )
    ]);
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
              Text(item.title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,),
            ],
          ),
        ),
      )
    );
  }

  ///热门专题
  Widget _getVideoList(Categories categories){
    if (ObjectUtil.isNotEmpty(categories) && !ObjectUtil.isEmptyList(categories.list)) {
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
                      Text(categories.name,
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
              categories.play_type == 1 ?
              Row(
                children: [
                  Expanded(child: _itemVideo(categories.list[0],categories.play_type)),
                  Expanded(child: _itemVideo(categories.list[1],categories.play_type)),
                  Expanded(child: _itemVideo(categories.list[2],categories.play_type)),
                ],
              ):
              Row(
                children: [
                  Expanded(child: _itemVideo(categories.list[0],categories.play_type)),
                  Expanded(child: _itemVideo(categories.list[1],categories.play_type)),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
  Widget _itemVideo(NewsItem item,int playType){
    var wh ;
    String img = "";
    if(playType == 1){
      wh = 18/25;
      img = item.mobileThumbs[0];
    }else{
      wh = 9/5;
      if (ObjectUtil.isNotEmpty(item.mobileThumbs)&& item.mobileThumbs.length > 1) {
        img = item.mobileThumbs[1];
      } else if (ObjectUtil.isNotEmpty(item.mobileThumbs)&& item.mobileThumbs.length > 0) {
        img = item.mobileThumbs[0];
      }
    }
    return InkWell(
        onTap: () {
          //点击
          //AppNavigator.push(context, VideoDetailPage(id: item.id.toString(),));
        },
        child:Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            child: Column(
              children: [
                Stack(
                  alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio:wh, //横纵比 长宽比  3:2
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.w),
                            child: LoadImage(img,fit: BoxFit.fill,width: double.maxFinite,
                              height:double.maxFinite,),
                          ),
                        ),
                        alignment: FractionalOffset.center,
                      ),
                    ),
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
            ),
          ),
        )
    );
  }
  Function _onItemClick(NewsItem newsItem){
    if ("news" == newsItem.type) {
      if (ObjectUtil.isNotEmpty(newsItem.web_redirect_url)) {
        AppNavigator.push(context, WebPage(url: newsItem.web_redirect_url,));
      }  else if (ObjectUtil.isNotEmpty(newsItem.detailUrl)) {
        AppNavigator.push(context, WebPage(url: newsItem.detailUrl,));
      }
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
  void didUpdateWidget(VideosListPage oldWidget) {
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