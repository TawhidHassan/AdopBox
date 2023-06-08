// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Category.dart';

part 'CategoryResponse.g.dart';

@JsonSerializable()
class CategoryResponse{


  String? status;
  List<Category>?getData;


  CategoryResponse(this.status, this.getData);


  factory CategoryResponse.fromJson(Map<String,dynamic>json)=>
      _$CategoryResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CategoryResponseToJson(this);
}