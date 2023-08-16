// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['_id'] as String?,
      json['vaccinated'] as bool?,
      json['description'] as String?,
      json['postTitle'] as String?,
      json['dieseas'] as bool?,
      json['petType'] as String?,
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['favouritePost'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['termsAndConditions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['published'] as num?,
      json['price'] as num?,
      json['postType'] as num?,
      json['weight'] as num?,
      json['age'] as num?,
      json['gender'] as num?,
      json['breed'] == null
          ? null
          : Breed.fromJson(json['breed'] as Map<String, dynamic>),
      json['origin'] == null
          ? null
          : Origin.fromJson(json['origin'] as Map<String, dynamic>),
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      json['postUserName'] as String?,
      json['postUser'] as String?,
      json['postSlug'] as String?,
      json['postUsernumber'] as String?,
      json['createdAt'] as String?,
      json['visited'] as num?,
      json['location'] == null
          ? null
          : PostLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      '_id': instance.id,
      'vaccinated': instance.vaccinated,
      'description': instance.description,
      'postTitle': instance.postTitle,
      'dieseas': instance.dieseas,
      'petType': instance.petType,
      'photos': instance.photos,
      'favouritePost': instance.favouritePost,
      'termsAndConditions': instance.termsAndConditions,
      'published': instance.published,
      'price': instance.price,
      'postType': instance.postType,
      'weight': instance.weight,
      'age': instance.age,
      'gender': instance.gender,
      'breed': instance.breed,
      'origin': instance.origin,
      'category': instance.category,
      'postUserName': instance.postUserName,
      'postUser': instance.postUser,
      'postSlug': instance.postSlug,
      'postUsernumber': instance.postUsernumber,
      'createdAt': instance.createdAt,
      'visited': instance.visited,
      'location': instance.location,
    };
