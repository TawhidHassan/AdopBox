// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Slider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slider _$SliderFromJson(Map<String, dynamic> json) => Slider(
      json['id'] as num?,
      json['heading'] as String?,
      json['text'] as String?,
      json['image'] as String?,
      json['status'] as num?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$SliderToJson(Slider instance) => <String, dynamic>{
      'id': instance.id,
      'heading': instance.heading,
      'text': instance.text,
      'image': instance.image,
      'status': instance.status,
      'created_at': instance.created_at,
    };
