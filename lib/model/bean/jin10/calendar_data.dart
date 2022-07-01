import 'package:json_annotation/json_annotation.dart';

part 'calendar_data.g.dart';


@JsonSerializable()
class CalendarData extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<CalendarItem> data;

  CalendarData(this.status,this.message,this.data,);

  factory CalendarData.fromJson(Map<String, dynamic> srcJson) => _$CalendarDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CalendarDataToJson(this);

}


@JsonSerializable()
class CalendarItem extends Object {

  @JsonKey(name: 'data_id')
  int dataId;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'indicator_id')
  int indicatorId;

  @JsonKey(name: 'time_period')
  String timePeriod;

  @JsonKey(name: 'previous')
  String previous;

  @JsonKey(name: 'pub_time')
  String pubTime;

  @JsonKey(name: 'indicator_name')
  String indicatorName;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'star')
  int star;

  @JsonKey(name: 'unit')
  String unit;

  @JsonKey(name: 'affect')
  int affect;

  @JsonKey(name: 'show')
  int show;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'show_affect')
  int showAffect;

  @JsonKey(name: 'pub_time_unix')
  int pubTimeUnix;

  @JsonKey(name: 'flag_url')
  String flagUrl;

  @JsonKey(name: 'flag_url_2x')
  String flagUrl2x;

  @JsonKey(name: 'detail_url')
  String detailUrl;

  String consensus;
  String actual;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'exchange_name')
  String exchangeName;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'rest_note')
  String restNote;

  @JsonKey(name: 'event_time')
  String eventTime;

  @JsonKey(name: 'event_content')
  String eventContent;

  @JsonKey(name: 'emergencies')
  int emergencies;

  @JsonKey(name: 'time_status')
  String timeStatus;

  CalendarItem(this.dataId,this.indicatorId,this.timePeriod,this.previous,this.pubTime,this.indicatorName,this.country,this.star,this.unit,this.affect,this.show,this.type,this.showAffect,this.pubTimeUnix,this.flagUrl,this.flagUrl2x,this.detailUrl,);

  factory CalendarItem.fromJson(Map<String, dynamic> srcJson) => _$CalendarItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CalendarItemToJson(this);

}


