// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      role: json['role'] as String?,
      request: json['request'] as String?,
      email: json['email'] as String?,
      gmailLogin: json['gmailLogin'] as bool?,
      active: json['active'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      meetUpdate: json['meetUpdate'] as num?,
      lat: json['lat'] as num?,
      long: json['long'] as num?,
      radius: json['radius'] as num?,
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
      'meetUpdate': instance.meetUpdate,
      'lat': instance.lat,
      'long': instance.long,
      'radius': instance.radius,
    };
