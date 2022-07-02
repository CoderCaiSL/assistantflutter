import 'package:assistantflutter/net/jin10/jin10_http_util.dart';
import 'package:assistantflutter/widgets/statepage/view_state_model.dart';

class NewsDetailModel extends ViewStateModel {

  String type;
  String id;

  var newsDetailData;

  NewsDetailModel(this.type,this.id);


  Future loadData() async {
    setBusy();
    try {
      newsDetailData = await Jin10HttpUtil().getDetailNews(type, id);
      setIdle();
      return newsDetailData;
    } catch (e, s) {
      setError(e,s);
      return null;
    }
  }

}