// ignore_for_file: file_names
import 'package:AdopBox/Data/Model/Breed/Breed.dart';
import 'package:AdopBox/Data/Model/Origin/Origin.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Category.dart';

part 'BreedOriginCategoryData.g.dart';

@JsonSerializable()
class BreedOriginCategoryData{



  List<Origin>? getOrigin;
  List<Category>? getCategory;
  List<Breed>? getBreed;


  BreedOriginCategoryData( this.getOrigin, this.getCategory, this.getBreed);

  factory BreedOriginCategoryData.fromJson(Map<String,dynamic>json)=>
      _$BreedOriginCategoryDataFromJson(json);
  Map<String,dynamic>toJson()=>_$BreedOriginCategoryDataToJson(this);
}