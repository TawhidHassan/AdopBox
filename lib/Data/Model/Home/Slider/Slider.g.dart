// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Slider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slider _$SliderFromJson(Map<String, dynamic> json) => Slider(
      json['status'] as num?,
      json['_id'] as String?,
      json['bannerTitle'] as String?,
      json['photo'] as String?,
      json['phlinkoto'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$SliderToJson(Slider instance) => <String, dynamic>{
      'status': instance.status,
      '_id': instance.id,
      'bannerTitle': instance.bannerTitle,
      'photo': instance.photo,
      'phlinkoto': instance.phlinkoto,
      'created_at': instance.created_at,
    };
