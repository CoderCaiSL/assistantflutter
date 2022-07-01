import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'market_data.g.dart';


@JsonSerializable()
class MarketData extends Object {

  List<All_exchange> all_exchange;
  List<All_stock> all_stock;
  List<All_type> all_type;

  MarketData(this.all_exchange,this.all_stock,);

  factory MarketData.fromJson(Map<String, dynamic> srcJson) => _$MarketDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);

}

@JsonSerializable()
class All_type extends Object {

  List<Exchange> list;

  String name;

  List<String> recommand;

  All_type(this.list,this.name,this.recommand,);

  factory All_type.fromJson(Map<String, dynamic> srcJson) => _$All_typeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$All_typeToJson(this);

}


@JsonSerializable()
class Exchange extends Object {

  List<String> exchange;

  String icon;

  String showname;

  List<String> subclass;

  Exchange(this.exchange,this.icon,this.showname,this.subclass,);

  factory Exchange.fromJson(Map<String, dynamic> srcJson) => _$ExchangeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExchangeToJson(this);

}


@JsonSerializable()
class All_exchange extends Object {

  String cn;

  String name;

  All_exchange(this.cn,this.name,);

  factory All_exchange.fromJson(Map<String, dynamic> srcJson) => _$All_exchangeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$All_exchangeToJson(this);

}


@JsonSerializable()
class All_stock extends Object {

  String cn;

  String code;

  int decimal;

  int effect;

  String exchange;

  String ntype;

  All_stock(this.cn,this.code,this.decimal,this.effect,this.exchange,this.ntype,);

  factory All_stock.fromJson(Map<String, dynamic> srcJson) => _$All_stockFromJson(srcJson);

  Map<String, dynamic> toJson() => _$All_stockToJson(this);

}

@JsonSerializable()
class MarketCateItem extends Object {
  String cate;
  List<MarketDetailItem> subItems;
  MarketCateItem();

  factory MarketCateItem.fromJson(Map<String, dynamic> srcJson) => _$MarketCateItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MarketCateItemToJson(this);
}
@JsonSerializable()
class MarketDetailItem extends Object {

  String code;
  String name;
  String strLatest = '1024';
  String strPer = '+10%';
  String strAmount = '100';
  String exchange;
  int d = 2;
  double close = 0.0;
  double open = 0.0;
  double hight = 0.0;
  double prices = 0.0;
  double gains = 0.0;

  MarketDetailItem(this.name,this.code,this.exchange,this.d);

  factory MarketDetailItem.fromJson(Map<String, dynamic> srcJson) => _$MarketDetailItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MarketDetailItemToJson(this);
}
@JsonSerializable()
class MarketRootData extends Object {

  List<MarketDetailItem> commends;
  List<MarketCateItem> cates;
  String cateName;

  MarketRootData();

  factory MarketRootData.fromJson(Map<String, dynamic> srcJson) => _$MarketRootDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MarketRootDataToJson(this);

}



