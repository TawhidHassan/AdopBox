// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'Slider.g.dart';

@JsonSerializable()
class Slider{


  num? id;
  String? heading;
  String? text;
  String? image;
  num? status;
  String? created_at;


  Slider(this.id, this.heading, this.text, this.image, this.status,
      this.created_at);

  factory Slider.fromJson(Map<String,dynamic>json)=>
      _$SliderFromJson(json);
  Map<String,dynamic>toJson()=>_$SliderToJson(this);
}