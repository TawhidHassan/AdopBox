// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['_id'] as String?,
      json['role'] as String?,
      json['request'] as String?,
      json['email'] as String?,
      json['gmailLogin'] as bool?,
      json['active'] as String?,
      json['fullName'] as String?,
      json['phoneNumber'] as String?,
      json['dob'] as String?,
      json['gender'] as String?,
      json['meetUpdate'] as num?,
      json['lat'] as num?,
      json['long'] as num?,
      json['radius'] as num?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'role': instance.role,
      'request': instance.request,
      'email': instance.email,
      'gmailLogin': instance.gmailLogin,
      'active': instance.active,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'dob': instance.dob,
      'gender': instance.gender,
      'meetUpdate': instance.meetUpdate,
      'lat': instance.lat,
      'long': instance.long,
      'radius': instance.radius,
    };
