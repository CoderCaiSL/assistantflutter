// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jin10_flash_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Jin10FlashData _$Jin10FlashDataFromJson(Map<String, dynamic> json) {
  return Jin10FlashData(
    json['status'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : FlashItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Jin10FlashDataToJson(Jin10FlashData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FlashItem _$FlashItemFromJson(Map<String, dynamic> json) {
  return FlashItem(
    json['id'] as String,
    json['time'] as String,
    json['type'] as int,
    json['data'] == null
        ? null
        : Data2.fromJson(json['data'] as Map<String, dynamic>),
    json['important'] as int,
    json['tags'] as List,
    (json['channel'] as List)?.map((e) => e as int)?.toList(),
    (json['remark'] as List)
        ?.map((e) =>
            e == null ? null : Remark.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FlashItemToJson(FlashItem instance) => <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'type': instance.type,
      'data': instance.data,
      'important': instance.important,
      'tags': instance.tags,
      'channel': instance.channel,
      'remark': instance.remark,
    };

Remark _$RemarkFromJson(Map<String, dynamic> json) {
  return Remark(
    json['id'],
    json['link'] as String,
    json['type'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$RemarkToJson(Remark instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'type': instance.type,
      'title': instance.title,
    };

Data2 _$Data2FromJson(Map<String, dynamic> json) {
  return Data2(
    json['pic'] as String,
    json['content'] as String,
  )
    ..flag = json['flag'] as int
    ..country = json['country'] as String
    ..time_period = json['time_period'] as String
    ..name = json['name'] as String
    ..unit = json['unit'] as String
    ..star = json['star'] as int
    ..previous = json['previous'] as String
    ..consensus = json['consensus'] as String
    ..actual = json['actual']
    ..revised = json['revised']
    ..affect = json['affect'] as int
    ..pub_time = json['pub_time'] as String
    ..measure = json['measure'] as String
    ..showPrev = json['showPrev'] as String
    ..showExpect = json['showExpect'] as String
    ..showPublish = json['showPublish'] as String
    ..data_id = json['data_id'] as int
    ..link = json['link'] as String
    ..title = json['title'] as String
    ..flagUrl = json['flagUrl'] as String
    ..vip_level = json['vip_level'] as int
    ..vip_desc = json['vip_desc'] as String
    ..vip_title = json['vip_title'] as String;
}

Map<String, dynamic> _$Data2ToJson(Data2 instance) => <String, dynamic>{
      'pic': instance.pic,
      'content': instance.content,
      'flag': instance.flag,
      'country': instance.country,
      'time_period': instance.time_period,
      'name': instance.name,
      'unit': instance.unit,
      'star': instance.star,
      'previous': instance.previous,
      'consensus': instance.consensus,
      'actual': instance.actual,
      'revised': instance.revised,
      'affect': instance.affect,
      'pub_time': instance.pub_time,
      'measure': instance.measure,
      'showPrev': instance.showPrev,
      'showExpect': instance.showExpect,
      'showPublish': instance.showPublish,
      'data_id': instance.data_id,
      'link': instance.link,
      'title': instance.title,
      'flagUrl': instance.flagUrl,
      'vip_level': instance.vip_level,
      'vip_desc': instance.vip_desc,
      'vip_title': instance.vip_title,
    };
