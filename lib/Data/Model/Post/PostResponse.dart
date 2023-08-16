// ignore_for_file: file_names
import 'package:AdopBox/Data/Model/Breed/Breed.dart';
import 'package:AdopBox/Data/Model/Category/Category.dart';
import 'package:AdopBox/Data/Model/Origin/Origin.dart';
import 'package:AdopBox/Data/Model/Post/Post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PostResponse.g.dart';

@JsonSerializable()
class PostResponse{

  String? status;
  List<Post>? getData;


  PostResponse(this.status, this.getData);

  factory PostResponse.fromJson(Map<String,dynamic>json)=>
      _$PostResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$PostResponseToJson(this);
}