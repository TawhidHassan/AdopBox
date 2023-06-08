// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'BreedOriginCategoryData.dart';
import 'Category.dart';

part 'BreedOriginCategoryResponse.g.dart';

@JsonSerializable()
class BreedOriginCategoryResponse{


  String? status;
  BreedOriginCategoryData?getData;


  BreedOriginCategoryResponse(this.status, this.getData);


  factory BreedOriginCategoryResponse.fromJson(Map<String,dynamic>json)=>
      _$BreedOriginCategoryResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$BreedOriginCategoryResponseToJson(this);
}