// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['getData'] == null
          ? null
          : User.fromJson(json['getData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'getData': instance.getData,
    };
