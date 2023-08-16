// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      json['status'] as String?,
      (json['getData'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'getData': instance.getData,
    };
