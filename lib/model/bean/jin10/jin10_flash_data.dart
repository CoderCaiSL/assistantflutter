import 'package:json_annotation/json_annotation.dart'; 
  
part 'jin10_flash_data.g.dart';


@JsonSerializable()
  class Jin10FlashData extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<FlashItem> data;

  Jin10FlashData(this.status,this.message,this.data,);

  factory Jin10FlashData.fromJson(Map<String, dynamic> srcJson) => _$Jin10FlashDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Jin10FlashDataToJson(this);

}

  
@JsonSerializable()
  class FlashItem extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'data')
  Data2 data;

  @JsonKey(name: 'important')
  int important;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'channel')
  List<int> channel;

  @JsonKey(name: 'remark')
  List<Remark> remark;

  FlashItem(this.id,this.time,this.type,this.data,this.important,this.tags,this.channel,this.remark,);

  factory FlashItem.fromJson(Map<String, dynamic> srcJson) => _$FlashItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FlashItemToJson(this);

}

@JsonSerializable()
class Remark extends Object {

  var id;

  String link;

  String type;

  String title;

  Remark(this.id,this.link,this.type,this.title,);

  factory Remark.fromJson(Map<String, dynamic> srcJson) => _$RemarkFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RemarkToJson(this);

}
@JsonSerializable()
  class Data2 extends Object {

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'content')
  String content;

  //数据用字段
  int flag;
  String country;
  String time_period;
  String name;
  String unit;
  int star;
  String previous;
  String consensus;
  var actual;
  var revised;
  int affect;
  String pub_time;
  String measure;

  String showPrev;
  String showExpect;
  String showPublish;

  int data_id;

  String link;
  String title;
  String flagUrl;
  int vip_level;
  String vip_desc;
  String vip_title;

  Data2(this.pic,this.content,);

  factory Data2.fromJson(Map<String, dynamic> srcJson) => _$Data2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Data2ToJson(this);

}

  
