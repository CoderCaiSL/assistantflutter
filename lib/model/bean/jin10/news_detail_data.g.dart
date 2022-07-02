// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailData _$NewsDetailDataFromJson(Map<String, dynamic> json) {
  return NewsDetailData(
    json['status'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DetailItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewsDetailDataToJson(NewsDetailData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DetailItem _$DetailItemFromJson(Map<String, dynamic> json) {
  return DetailItem(
    json['id'] as String,
    json['time'] as String,
    json['type'] as int,
    json['data'] == null
        ? null
        : DetailItem.fromJson(json['data'] as Map<String, dynamic>),
    json['important'] as int,
    json['tags'] as List,
    (json['channel'] as List)?.map((e) => e as int)?.toList(),
    json['remark'] as List,
  );
}

Map<String, dynamic> _$DetailItemToJson(DetailItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'type': instance.type,
      'data': instance.data,
      'important': instance.important,
      'tags': instance.tags,
      'channel': instance.channel,
      'remark': instance.remark,
    };

NewsContentData _$NewsContentDataFromJson(Map<String, dynamic> json) {
  return NewsContentData(
    json['pic'] as String,
    json['content'] as String,
  );
}

Map<String, dynamic> _$NewsContentDataToJson(NewsContentData instance) =>
    <String, dynamic>{
      'pic': instance.pic,
      'content': instance.content,
    };
