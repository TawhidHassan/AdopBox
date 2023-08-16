// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostLocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLocation _$PostLocationFromJson(Map<String, dynamic> json) => PostLocation(
      json['type'] as String?,
      (json['coordinates'] as List<dynamic>?)?.map((e) => e as num).toList(),
    );

Map<String, dynamic> _$PostLocationToJson(PostLocation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
