// ignore_for_file: file_names
import 'package:AdopBox/Data/Model/Breed/Breed.dart';
import 'package:AdopBox/Data/Model/Category/Category.dart';
import 'package:AdopBox/Data/Model/Origin/Origin.dart';
import 'package:AdopBox/Data/Model/Post/Post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SinglePostResponse.g.dart';

@JsonSerializable()
class SinglePostResponse{

  String? status;
  Post? getData;


  SinglePostResponse(this.status, this.getData);

  factory SinglePostResponse.fromJson(Map<String,dynamic>json)=>
      _$SinglePostResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SinglePostResponseToJson(this);
}