 import 'package:common_utils/common_utils.dart';
import 'package:assistantflutter/model/bean/jin10/jin10_news_data.dart';
import 'package:assistantflutter/model/bean/jin10/news_vip_tab_data.dart';
import 'package:assistantflutter/net/jin10/jin10_http_util.dart';
import 'package:assistantflutter/widgets/statepage/view_state_refresh_list_model.dart';

class NewsListModel extends ViewStateRefreshListModel{

  final NewsVipTab data;


  Jin10NewsData jin10newsData;

  NewsListModel(this.data);


  @override
  Future<List> loadData({int pageNum, int pageSize}) async {
    Jin10NewsData tmp  = await Jin10HttpUtil().getNewsList(data.id, pageNum);
    if (pageNum == 1) {
      jin10newsData = tmp;
      if (ObjectUtil.isNotEmpty(jin10newsData.data.hot_topics) &&
          ObjectUtil.isNotEmpty(jin10newsData.data.hot_topics.list) &&
          !ObjectUtil.isEmptyList(jin10newsData.data.hot_topics.list)
      ) {
        List<NewsItem> tmpList = jin10newsData.data.list.sublist(0,2);
        jin10newsData.data.listForHot = tmpList;
        jin10newsData.data.list = jin10newsData.data.list.sublist(2,jin10newsData.data.list.length-1);
      }
    }
    if ("video_home" == data.display_type) {
      return tmp.data.categories;
    }else{
      return tmp.data.list;
    }
  }


}