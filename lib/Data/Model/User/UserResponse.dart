// ignore_for_file: file_names
import 'package:AdopBox/Data/Model/User/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UserResponse.g.dart';

@JsonSerializable()
class UserResponse{


  String? status;
  String? message;
  User? getData;


  UserResponse(this.status, this.message, this.getData);

  factory UserResponse.fromJson(Map<String,dynamic>json)=>
      _$UserResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$UserResponseToJson(this);
}