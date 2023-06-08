// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User{

  @JsonKey(name: "_id")
  String? id;
  String? role;
  String? request;
  String? email;
  bool? gmailLogin;
  String? active;
  String? fullName;
  String? phoneNumber;
  num? meetUpdate;
  num? lat;
  num? long;
  num? radius;


  User(
      {this.id,
      this.role,
      this.request,
      this.email,
      this.gmailLogin,
      this.active,
      this.fullName,
      this.phoneNumber,
      this.meetUpdate,
      this.lat,
      this.long,
      this.radius});

  factory User.fromJson(Map<String,dynamic>json)=>
      _$UserFromJson(json);
  Map<String,dynamic>toJson()=>_$UserToJson(this);
}