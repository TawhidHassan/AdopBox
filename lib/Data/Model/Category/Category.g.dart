// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String?,
      categoryName: json['categoryName'] as String?,
      categorySlug: json['categorySlug'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'categoryName': instance.categoryName,
      'categorySlug': instance.categorySlug,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
    };
