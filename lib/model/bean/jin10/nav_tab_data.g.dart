// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_tab_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashTabData _$FlashTabDataFromJson(Map<String, dynamic> json) {
  return FlashTabData(
    json['status'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : NavData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FlashTabDataToJson(FlashTabData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

NavData _$NavDataFromJson(Map<String, dynamic> json) {
  return NavData(
    json['id'] as int,
    json['name'] as String,
    (json['real_channels'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$NavDataToJson(NavData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'real_channels': instance.realChannels,
    };
