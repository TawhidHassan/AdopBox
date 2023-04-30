// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SliderResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderResponse _$SliderResponseFromJson(Map<String, dynamic> json) =>
    SliderResponse(
      json['success'] as bool?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderResponseToJson(SliderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
