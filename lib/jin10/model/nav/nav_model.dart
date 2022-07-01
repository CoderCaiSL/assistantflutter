import 'package:assistantflutter/net/jin10/jin10_http_util.dart';
import 'package:assistantflutter/widgets/statepage/view_state_model.dart';

class NavModel extends ViewStateModel {

  static const int type_flash = 1;
  static const int type_news = 2;
  static const int type_vip = 3;
  static const int type_market = 4;
  static const int type_other = 5;

  int type;

  var navTabData;

  NavModel(this.type);


  Future loadData() async {
    setBusy();
    try {
      if(type_flash == type){
        navTabData = await Jin10HttpUtil().getFlashTabList();
      }else if(type_news == type){
        navTabData = await Jin10HttpUtil().getNewsOrVipTabList("app");
      }else if(type_vip == type){
        navTabData =  await Jin10HttpUtil().getNewsOrVipTabList("app_vip");
      }
      setIdle();
      return navTabData;
    } catch (e, s) {
      setError(e,s);
      return null;
    }
  }

}