// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketData _$MarketDataFromJson(Map<String, dynamic> json) {
  return MarketData(
    (json['all_exchange'] as List)
        ?.map((e) =>
            e == null ? null : All_exchange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['all_stock'] as List)
        ?.map((e) =>
            e == null ? null : All_stock.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..all_type = (json['all_type'] as List)
      ?.map((e) =>
          e == null ? null : All_type.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$MarketDataToJson(MarketData instance) =>
    <String, dynamic>{
      'all_exchange': instance.all_exchange,
      'all_stock': instance.all_stock,
      'all_type': instance.all_type,
    };

All_type _$All_typeFromJson(Map<String, dynamic> json) {
  return All_type(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Exchange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['name'] as String,
    (json['recommand'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$All_typeToJson(All_type instance) => <String, dynamic>{
      'list': instance.list,
      'name': instance.name,
      'recommand': instance.recommand,
    };

Exchange _$ExchangeFromJson(Map<String, dynamic> json) {
  return Exchange(
    (json['exchange'] as List)?.map((e) => e as String)?.toList(),
    json['icon'] as String,
    json['showname'] as String,
    (json['subclass'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ExchangeToJson(Exchange instance) => <String, dynamic>{
      'exchange': instance.exchange,
      'icon': instance.icon,
      'showname': instance.showname,
      'subclass': instance.subclass,
    };

All_exchange _$All_exchangeFromJson(Map<String, dynamic> json) {
  return All_exchange(
    json['cn'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$All_exchangeToJson(All_exchange instance) =>
    <String, dynamic>{
      'cn': instance.cn,
      'name': instance.name,
    };

All_stock _$All_stockFromJson(Map<String, dynamic> json) {
  return All_stock(
    json['cn'] as String,
    json['code'] as String,
    json['decimal'] as int,
    json['effect'] as int,
    json['exchange'] as String,
    json['ntype'] as String,
  );
}

Map<String, dynamic> _$All_stockToJson(All_stock instance) => <String, dynamic>{
      'cn': instance.cn,
      'code': instance.code,
      'decimal': instance.decimal,
      'effect': instance.effect,
      'exchange': instance.exchange,
      'ntype': instance.ntype,
    };

MarketCateItem _$MarketCateItemFromJson(Map<String, dynamic> json) {
  return MarketCateItem()
    ..cate = json['cate'] as String
    ..subItems = (json['subItems'] as List)
        ?.map((e) => e == null
            ? null
            : MarketDetailItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MarketCateItemToJson(MarketCateItem instance) =>
    <String, dynamic>{
      'cate': instance.cate,
      'subItems': instance.subItems,
    };

MarketDetailItem _$MarketDetailItemFromJson(Map<String, dynamic> json) {
  return MarketDetailItem(
    json['name'] as String,
    json['code'] as String,
    json['exchange'] as String,
    json['d'] as int,
  )
    ..strLatest = json['strLatest'] as String
    ..strPer = json['strPer'] as String
    ..strAmount = json['strAmount'] as String
    ..close = (json['close'] as num)?.toDouble()
    ..open = (json['open'] as num)?.toDouble()
    ..hight = (json['hight'] as num)?.toDouble()
    ..prices = (json['prices'] as num)?.toDouble()
    ..gains = (json['gains'] as num)?.toDouble();
}

Map<String, dynamic> _$MarketDetailItemToJson(MarketDetailItem instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'strLatest': instance.strLatest,
      'strPer': instance.strPer,
      'strAmount': instance.strAmount,
      'exchange': instance.exchange,
      'd': instance.d,
      'close': instance.close,
      'open': instance.open,
      'hight': instance.hight,
      'prices': instance.prices,
      'gains': instance.gains,
    };

MarketRootData _$MarketRootDataFromJson(Map<String, dynamic> json) {
  return MarketRootData()
    ..commends = (json['commends'] as List)
        ?.map((e) => e == null
            ? null
            : MarketDetailItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..cates = (json['cates'] as List)
        ?.map((e) => e == null
            ? null
            : MarketCateItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..cateName = json['cateName'] as String;
}

Map<String, dynamic> _$MarketRootDataToJson(MarketRootData instance) =>
    <String, dynamic>{
      'commends': instance.commends,
      'cates': instance.cates,
      'cateName': instance.cateName,
    };
