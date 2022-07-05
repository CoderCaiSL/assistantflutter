import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:assistantflutter/app_theme.dart';
import 'package:assistantflutter/jin10/model/flash/flash_list_model.dart';
import 'package:assistantflutter/jin10/page/flash/live_crad_page.dart';
import 'package:assistantflutter/model/bean/jin10/jin10_flash_data.dart';
import 'package:assistantflutter/model/bean/jin10/nav_tab_data.dart';
import 'package:assistantflutter/util/app_navigator.dart';
import 'package:assistantflutter/widgets/load_image.dart';
import 'package:assistantflutter/widgets/statepage/provider_widget.dart';
import 'package:assistantflutter/widgets/statepage/view_state_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:assistantflutter/util/common_date_utils.dart';

import '../../../web_page.dart';
import '../../../widgets/images_list_page.dart';

class FlashListPage extends StatefulWidget {
  final NavData navData;

  const FlashListPage({Key key, this.navData}) : super(key: key);

  @override
  FlashListPageState createState() => new FlashListPageState();
}

class FlashListPageState extends State<FlashListPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  FlashListModel _model;
  int index = 0;

  ScrollController _controller = new ScrollController();
  bool _onNotification(ScrollNotification notice) {
    final SliverMultiBoxAdaptorElement sliverMultiBoxAdaptorElement =
    findSliverMultiBoxAdaptorElement(notice.context as Element);

    final viewportDimension = notice.metrics.viewportDimension;

    int firstIndex = 0;
    int lastIndex = 0;
    void onVisitChildren(Element element) {
      final SliverMultiBoxAdaptorParentData oldParentData =
      element.renderObject?.parentData as SliverMultiBoxAdaptorParentData;
      double layoutOffset = oldParentData.layoutOffset;
      double pixels = notice.metrics.pixels;
      double all = pixels + viewportDimension;
      if (layoutOffset >= pixels) {
        ///first和last是不同item
        firstIndex = min(firstIndex, oldParentData.index - 1);
        if (layoutOffset <= all) {
          lastIndex = max(lastIndex, oldParentData.index);
        }
        firstIndex = max(firstIndex, 0);
      } else {
        ///first和last是同一个item
        lastIndex = firstIndex = oldParentData.index;
      }
    }
    print('测试$index');
    /*setState(() {
      index = lastIndex;
    });*/
    if(onVisitChildren!=null){
      sliverMultiBoxAdaptorElement.visitChildren(onVisitChildren);
    }
    return false;
  }

  SliverMultiBoxAdaptorElement findSliverMultiBoxAdaptorElement(
      Element element) {
    if (element is SliverMultiBoxAdaptorElement) {
      return element;
    }
    SliverMultiBoxAdaptorElement target;
    element.visitChildElements((child) {
      target = findSliverMultiBoxAdaptorElement(child);
    });
    return target;
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<FlashListModel> (
      autoDispose: false,
      model: FlashListModel(widget.navData.id),
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
       return  Stack(
         alignment:Alignment.topLeft,
         children: [
           SmartRefresher(
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
             child: ListView.builder(
               controller: _controller,
               itemCount: model.list.length,
               itemBuilder: (c, i) => InkWell(
                 onTap: (){
                   _onItemClick(model.list[i]);
                 },
                   child: _itemList(model.list[i],i == 0?null:model.list[i-1])),
             ),
           ),
           getTimeWidgetTop(),
         ],
       );
      },
    );
  }
  Widget getTimeWidgetTop(){
    if(ObjectUtil.isNotEmpty(_model.list) && !ObjectUtil.isEmptyList(_model.list)){
      FlashItem item = _model.list[index];
      return Container(
        width: 40.w,
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            color: AppTheme.jin10Bg,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppTheme.nearlyBlue,
                  child: Padding(
                    padding: EdgeInsets.all(2.0.w),
                    child: Text('${CommonDateUtils.getMoth(item.time)}月',
                      style: new TextStyle(fontSize: 8.sp,color: AppTheme.white),),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(2.0.w),
                    child: Text('${CommonDateUtils.getDay(item.time)}',
                      style: new TextStyle(fontSize: 12.sp,color: AppTheme.nearlyBlue),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ;
    }else{
      return SizedBox();
    }
  }

  Widget getTimeWidget(FlashItem item,FlashItem lastItem){
    if(lastItem != null && !CommonDateUtils.isSameDay(item.time, lastItem.time)){
      return Container(
        color: AppTheme.jin10Bg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppTheme.nearlyBlue,
              child: Padding(
                padding: EdgeInsets.all(2.0.w),
                child: Text('${CommonDateUtils.getMoth(item.time)}月',
                  style: new TextStyle(fontSize: 8.sp,color: AppTheme.white),),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(2.0.w),
                child: Text('${CommonDateUtils.getDay(item.time)}',
                  style: new TextStyle(fontSize: 12.sp,color: AppTheme.nearlyBlue),),
              ),
            ),
          ],
        ),
      ) ;
    }else{
      return SizedBox();
    }
  }

  Widget _itemList(FlashItem item, FlashItem lastItem){
    String content = item.data.content;
    if(ObjectUtil.isEmptyString(content)){
      content = item.data.title;
    }
    if(ObjectUtil.isEmptyString(content)){
      content = item.data.vip_title;
    }
    if(ObjectUtil.isEmptyString(content)){
      content = item.data.vip_desc;
    }
    if(ObjectUtil.isNotEmpty(content)){
      return Container(
        color: AppTheme.bg_white,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40.w,
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment:Alignment.topCenter , //指定未定位或部分定位widget的对齐方式
                  children: [
                    VerticalDivider(),
                    Container(
                      width: 10.w,
                        height: 10.h,
                        child: LoadAssetImage("jin10/dot",width: 10.w,height: 10.h,)),
                    getTimeWidget(item,lastItem),
                  ],
                )
              ),
              Expanded(
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black54, width: 0.5),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(item.time.split(' ')[1],
                            style: new TextStyle(fontSize: 9),),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Container(
                            child: Html(
                              data: content,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 0.h, 8.w, 8.h),
                        child: getPicWidget(item),
                      ),
                    ],
                  ),
                ),
                flex: 10,
              ),
            ],
          ),
        ),
      );
    }else{
      return SizedBox();
    }
    
  }
  Widget getPicWidget(FlashItem _flashItem){
    if (ObjectUtil.isEmptyString(_flashItem.data.pic)) {
      return SizedBox();
    }
    List<String> url = [_flashItem.data.pic];
    return InkWell(
      onTap: (){
        AppNavigator.push(context, ImageListPage(url,initialPage: 0,));
      },
        child: LoadImage(_flashItem.data.pic,width: 120.w,height: 60,));
  }

  Function _onItemClick(FlashItem item){
    if (ObjectUtil.isNotEmpty(item.remark) && !ObjectUtil.isEmptyList(item.remark)) {
      if ('link' == item.remark[0].type && !ObjectUtil.isEmptyString(item.remark[0].link)) {
        AppNavigator.push(context, WebPage(url: item.remark[0].link,));
      }
    }else{
      AppNavigator.push(context, LiveCardPage(flashItem: item,));
    }
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
    _model.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(FlashListPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
