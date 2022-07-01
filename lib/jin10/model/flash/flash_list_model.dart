 import 'package:assistantflutter/model/bean/jin10/jin10_flash_data.dart';
import 'package:assistantflutter/net/jin10/jin10_http_util.dart';
import 'package:assistantflutter/widgets/statepage/view_state_refresh_list_time_model.dart';

class FlashListModel extends ViewStateRefreshListForTimeModel{

  final int id;

  FlashListModel(this.id);

  @override
  Future<List> loadData({String max_time}) async {
    if(max_time == null || max_time.isEmpty){
      List<FlashItem> list = await Jin10HttpUtil().getFlashList(id);
      return list;
    }else{
      List<FlashItem> list = await Jin10HttpUtil().getFlashListMore(id,max_time);
      return list;
    }
  }

  @override
  Future setLoadMoreData({var data}) {
    List<FlashItem> tmp = data;
    max_time = tmp.last.time;
  }




}