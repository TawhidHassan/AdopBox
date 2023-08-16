// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SinglePostResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SinglePostResponse _$SinglePostResponseFromJson(Map<String, dynamic> json) =>
    SinglePostResponse(
      json['status'] as String?,
      json['getData'] == null
          ? null
          : Post.fromJson(json['getData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SinglePostResponseToJson(SinglePostResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'getData': instance.getData,
    };
