// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      json['_id'] as String?,
      json['totalBreed'] as num?,
      json['breedName'] as String?,
      json['category'] as String?,
      json['breedSlug'] as String?,
      json['origin'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      '_id': instance.id,
      'totalBreed': instance.totalBreed,
      'breedName': instance.breedName,
      'category': instance.category,
      'breedSlug': instance.breedSlug,
      'origin': instance.origin,
      'createdAt': instance.createdAt,
    };
