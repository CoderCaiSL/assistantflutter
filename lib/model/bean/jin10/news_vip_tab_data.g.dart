// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_vip_tab_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsVipTabData _$NewsVipTabDataFromJson(Map<String, dynamic> json) =>
    NewsVipTabData(
      json['status'] as int,
      NewsVipData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsVipTabDataToJson(NewsVipTabData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

NewsVipData _$NewsVipDataFromJson(Map<String, dynamic> json) => NewsVipData(
      (json['list'] as List<dynamic>)
          .map((e) => NewsVipTab.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$NewsVipDataToJson(NewsVipData instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
    };

NewsVipTab _$NewsVipTabFromJson(Map<String, dynamic> json) => NewsVipTab(
      json['id'] as int,
      json['name'] as String,
      (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      json['is_hot'] as int,
      json['sort'] as int,
      json['is_home'] as int,
      json['is_edit'] as int,
      json['show_vip_flag'] as int,
      json['play_type'] as int,
      json['display_type'] as String,
      json['p_id'] as int,
      Extra.fromJson(json['extra'] as Map<String, dynamic>),
      json['child'] as List<dynamic>,
    )..web_redirect_url = json['web_redirect_url'] as String;

Map<String, dynamic> _$NewsVipTabToJson(NewsVipTab instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': instance.types,
      'is_hot': instance.is_hot,
      'sort': instance.sort,
      'is_home': instance.is_home,
      'is_edit': instance.is_edit,
      'show_vip_flag': instance.show_vip_flag,
      'play_type': instance.play_type,
      'display_type': instance.display_type,
      'p_id': instance.p_id,
      'extra': instance.extra,
      'child': instance.child,
      'web_redirect_url': instance.web_redirect_url,
    };

Extra _$ExtraFromJson(Map<String, dynamic> json) => Extra(
      json['vip_bg_img'] as String,
      json['common_bg_img'] as String,
      json['vip_redirect_url'] as String,
      json['common_redirect_url'] as String,
    );

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'vip_bg_img': instance.vip_bg_img,
      'common_bg_img': instance.common_bg_img,
      'vip_redirect_url': instance.vip_redirect_url,
      'common_redirect_url': instance.common_redirect_url,
    };
