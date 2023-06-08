// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'Category.g.dart';

@JsonSerializable()
class Category{

  @JsonKey(name: "_id")
  String? id;
  String? categoryName;
  String? categorySlug;
  String? icon;
  String? createdAt;


  Category(
      {this.id, this.categoryName, this.categorySlug, this.icon, this.createdAt});

  factory Category.fromJson(Map<String,dynamic>json)=>
      _$CategoryFromJson(json);
  Map<String,dynamic>toJson()=>_$CategoryToJson(this);
}