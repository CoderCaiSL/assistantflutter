import 'package:json_annotation/json_annotation.dart';

part 'news_vip_tab_data.g.dart';


@JsonSerializable()
class NewsVipTabData extends Object {

  int status;

  NewsVipData data;

  NewsVipTabData(this.status,this.data,);

  factory NewsVipTabData.fromJson(Map<String, dynamic> srcJson) => _$NewsVipTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsVipTabDataToJson(this);

}


@JsonSerializable()
class NewsVipData extends Object {

  List<NewsVipTab> list;

  int total;

  NewsVipData(this.list,this.total,);

  factory NewsVipData.fromJson(Map<String, dynamic> srcJson) => _$NewsVipDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsVipDataToJson(this);

}


@JsonSerializable()
class NewsVipTab extends Object {

  int id;

  String name;

  List<String> types;

  int is_hot;

  int sort;

  int is_home;

  int is_edit;

  int show_vip_flag;

  int play_type;

  String display_type;

  int p_id;

  Extra extra;

  List<dynamic> child;

  String web_redirect_url;

  NewsVipTab(this.id,this.name,this.types,this.is_hot,this.sort,this.is_home,this.is_edit,this.show_vip_flag,this.play_type,this.display_type,this.p_id,this.extra,this.child,);

  factory NewsVipTab.fromJson(Map<String, dynamic> srcJson) => _$NewsVipTabFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsVipTabToJson(this);

}


@JsonSerializable()
class Extra extends Object {

  String vip_bg_img;

  String common_bg_img;

  String vip_redirect_url;

  String common_redirect_url;

  Extra(this.vip_bg_img,this.common_bg_img,this.vip_redirect_url,this.common_redirect_url,);

  factory Extra.fromJson(Map<String, dynamic> srcJson) => _$ExtraFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExtraToJson(this);

}


