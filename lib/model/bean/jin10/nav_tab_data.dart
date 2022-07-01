import 'package:json_annotation/json_annotation.dart'; 
  
part 'nav_tab_data.g.dart';


@JsonSerializable()
  class FlashTabData extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<NavData> data;

  FlashTabData(this.status,this.message,this.data,);

  factory FlashTabData.fromJson(Map<String, dynamic> srcJson) => _$FlashTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FlashTabDataToJson(this);

}

  
@JsonSerializable()
  class NavData extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'real_channels')
  List<int> realChannels;

  NavData(this.id,this.name,this.realChannels,);

  factory NavData.fromJson(Map<String, dynamic> srcJson) => _$NavDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NavDataToJson(this);


}




