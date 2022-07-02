// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarData _$CalendarDataFromJson(Map<String, dynamic> json) {
  return CalendarData(
    json['status'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : CalendarItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CalendarDataToJson(CalendarData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CalendarItem _$CalendarItemFromJson(Map<String, dynamic> json) {
  return CalendarItem(
    json['data_id'] as int,
    json['indicator_id'] as int,
    json['time_period'] as String,
    json['previous'] as String,
    json['pub_time'] as String,
    json['indicator_name'] as String,
    json['country'] as String,
    json['star'] as int,
    json['unit'] as String,
    json['affect'] as int,
    json['show'] as int,
    json['type'] as int,
    json['show_affect'] as int,
    json['pub_time_unix'] as int,
    json['flag_url'] as String,
    json['flag_url_2x'] as String,
    json['detail_url'] as String,
  )
    ..date = json['date'] as String
    ..consensus = json['consensus'] as String
    ..actual = json['actual'] as String
    ..id = json['id'] as int
    ..exchangeName = json['exchange_name'] as String
    ..name = json['name'] as String
    ..category = json['category'] as String
    ..restNote = json['rest_note'] as String
    ..eventTime = json['event_time'] as String
    ..eventContent = json['event_content'] as String
    ..emergencies = json['emergencies'] as int
    ..timeStatus = json['time_status'] as String;
}

Map<String, dynamic> _$CalendarItemToJson(CalendarItem instance) =>
    <String, dynamic>{
      'data_id': instance.dataId,
      'date': instance.date,
      'indicator_id': instance.indicatorId,
      'time_period': instance.timePeriod,
      'previous': instance.previous,
      'pub_time': instance.pubTime,
      'indicator_name': instance.indicatorName,
      'country': instance.country,
      'star': instance.star,
      'unit': instance.unit,
      'affect': instance.affect,
      'show': instance.show,
      'type': instance.type,
      'show_affect': instance.showAffect,
      'pub_time_unix': instance.pubTimeUnix,
      'flag_url': instance.flagUrl,
      'flag_url_2x': instance.flagUrl2x,
      'detail_url': instance.detailUrl,
      'consensus': instance.consensus,
      'actual': instance.actual,
      'id': instance.id,
      'exchange_name': instance.exchangeName,
      'name': instance.name,
      'category': instance.category,
      'rest_note': instance.restNote,
      'event_time': instance.eventTime,
      'event_content': instance.eventContent,
      'emergencies': instance.emergencies,
      'time_status': instance.timeStatus,
    };
