import 'package:json_annotation/json_annotation.dart';

part 'news_detail_data.g.dart';


@JsonSerializable()
class NewsDetailData extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<DetailItem> data;

  NewsDetailData(this.status,this.message,this.data,);

  factory NewsDetailData.fromJson(Map<String, dynamic> srcJson) => _$NewsDetailDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsDetailDataToJson(this);

}


@JsonSerializable()
class DetailItem extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'data')
  DetailItem data;

  @JsonKey(name: 'important')
  int important;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'channel')
  List<int> channel;

  @JsonKey(name: 'remark')
  List<dynamic> remark;

  DetailItem(this.id,this.time,this.type,this.data,this.important,this.tags,this.channel,this.remark,);

  factory DetailItem.fromJson(Map<String, dynamic> srcJson) => _$DetailItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DetailItemToJson(this);

}


@JsonSerializable()
class NewsContentData extends Object {

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'content')
  String content;

  NewsContentData(this.pic,this.content,);

  factory NewsContentData.fromJson(Map<String, dynamic> srcJson) => _$NewsContentDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsContentDataToJson(this);

}


