// ignore_for_file: file_names
import 'package:AdopBox/Data/Model/User/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SignupResponse.g.dart';

@JsonSerializable()
class SignupResponse{



  String? status;
  String? message;
  String? token;
  User? user;


  SignupResponse(this.status, this.message, this.token, this.user);

  factory SignupResponse.fromJson(Map<String,dynamic>json)=>
      _$SignupResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SignupResponseToJson(this);
}