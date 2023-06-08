// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BreedOriginCategoryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedOriginCategoryResponse _$BreedOriginCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    BreedOriginCategoryResponse(
      json['status'] as String?,
      json['getData'] == null
          ? null
          : BreedOriginCategoryData.fromJson(
              json['getData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BreedOriginCategoryResponseToJson(
        BreedOriginCategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'getData': instance.getData,
    };
