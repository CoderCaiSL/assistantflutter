import 'package:json_annotation/json_annotation.dart';
part 'base_bean.g.dart';

@JsonSerializable()
class Jin10BaseBean {

  int status;

  String message;

  factory Jin10BaseBean.fromJson(Map<String, dynamic> srcJson) => _$Jin10BaseBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Jin10BaseBeanToJson(this);

  Jin10BaseBean(this.status, this.message);
}