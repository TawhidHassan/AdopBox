// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BreedOriginCategoryData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedOriginCategoryData _$BreedOriginCategoryDataFromJson(
        Map<String, dynamic> json) =>
    BreedOriginCategoryData(
      (json['getOrigin'] as List<dynamic>?)
          ?.map((e) => Origin.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['getCategory'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['getBreed'] as List<dynamic>?)
          ?.map((e) => Breed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BreedOriginCategoryDataToJson(
        BreedOriginCategoryData instance) =>
    <String, dynamic>{
      'getOrigin': instance.getOrigin,
      'getCategory': instance.getCategory,
      'getBreed': instance.getBreed,
    };
