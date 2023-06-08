// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'Origin.g.dart';

@JsonSerializable()
class Origin{

  @JsonKey(name: "_id")
  String? id;
  num? totalBreed;
  String? originName;
  String? category;
  String? originSlug;
  String? createdAt;


  Origin(this.id, this.totalBreed, this.originName, this.category,
      this.originSlug, this.createdAt);

  factory Origin.fromJson(Map<String,dynamic>json)=>
      _$OriginFromJson(json);
  Map<String,dynamic>toJson()=>_$OriginToJson(this);
}