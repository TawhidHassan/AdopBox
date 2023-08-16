// ignore_for_file: file_names
import 'package:AdopBox/Data/Model/Breed/Breed.dart';
import 'package:AdopBox/Data/Model/Category/Category.dart';
import 'package:AdopBox/Data/Model/Origin/Origin.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Location/PostLocation.dart';

part 'Post.g.dart';

@JsonSerializable()
class Post{

  @JsonKey(name: "_id")
  String? id;
  bool? vaccinated;
  String? description;
  String? postTitle;
  bool? dieseas;
  String? petType;
  List<String>? photos;
  List<String>? favouritePost;
  List<String>? termsAndConditions;
  num? published;
  num? price;
  num? postType;
  num? weight;
  num? age;
  num? gender;
  Breed? breed;
  Origin? origin;
  Category? category;
  String? postUserName;
  String? postUser;
  String? postSlug;
  String? postUsernumber;
  String? createdAt;
  num? visited;
  PostLocation?location;


  Post(
      this.id,
      this.vaccinated,
      this.description,
      this.postTitle,
      this.dieseas,
      this.petType,
      this.photos,
      this.favouritePost,
      this.termsAndConditions,
      this.published,
      this.price,
      this.postType,
      this.weight,
      this.age,
      this.gender,
      this.breed,
      this.origin,
      this.category,
      this.postUserName,
      this.postUser,
      this.postSlug,
      this.postUsernumber,
      this.createdAt,
      this.visited,
      this.location);

  factory Post.fromJson(Map<String,dynamic>json)=>
      _$PostFromJson(json);
  Map<String,dynamic>toJson()=>_$PostToJson(this);
}