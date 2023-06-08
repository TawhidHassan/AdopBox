// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'Breed.g.dart';

@JsonSerializable()
class Breed{

  @JsonKey(name: "_id")
  String? id;
  num? totalBreed;
  String? breedName;
  String? category;
  String? breedSlug;
  String? origin;
  String? createdAt;


  Breed(this.id, this.totalBreed, this.breedName, this.category, this.breedSlug,
      this.origin, this.createdAt);

  factory Breed.fromJson(Map<String,dynamic>json)=>
      _$BreedFromJson(json);
  Map<String,dynamic>toJson()=>_$BreedToJson(this);
}