// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'Slider.g.dart';

@JsonSerializable()
class Slider{


  num? status;
  @JsonKey(name: "_id")
  String? id;
  String? bannerTitle;
  String? photo;
  String? phlinkoto;
  String? created_at;


  Slider(this.status, this.id, this.bannerTitle, this.photo, this.phlinkoto,
      this.created_at);

  factory Slider.fromJson(Map<String,dynamic>json)=>
      _$SliderFromJson(json);
  Map<String,dynamic>toJson()=>_$SliderToJson(this);
}