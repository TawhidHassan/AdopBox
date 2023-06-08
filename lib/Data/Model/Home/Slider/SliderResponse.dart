// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Slider.dart';

part 'SliderResponse.g.dart';

@JsonSerializable()
class SliderResponse{



  bool? success;
  String? status;
  List<Slider>?getData;


  SliderResponse(this.success, this.status, this.getData);

  factory SliderResponse.fromJson(Map<String,dynamic>json)=>
      _$SliderResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SliderResponseToJson(this);
}