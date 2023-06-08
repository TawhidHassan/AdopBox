// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Origin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Origin _$OriginFromJson(Map<String, dynamic> json) => Origin(
      json['_id'] as String?,
      json['totalBreed'] as num?,
      json['originName'] as String?,
      json['category'] as String?,
      json['originSlug'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$OriginToJson(Origin instance) => <String, dynamic>{
      '_id': instance.id,
      'totalBreed': instance.totalBreed,
      'originName': instance.originName,
      'category': instance.category,
      'originSlug': instance.originSlug,
      'createdAt': instance.createdAt,
    };
