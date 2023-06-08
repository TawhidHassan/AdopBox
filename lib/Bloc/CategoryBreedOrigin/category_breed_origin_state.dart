part of 'category_breed_origin_cubit.dart';

@immutable
abstract class CategoryBreedOriginState {}

class CategoryBreedOriginInitial extends CategoryBreedOriginState {}


class CategoryBreedOriginGet extends CategoryBreedOriginState {
  final BreedOriginCategoryResponse? breedOriginCategoryResponse;

  CategoryBreedOriginGet({this.breedOriginCategoryResponse});

  Map<String, dynamic> toMap() {
    return {
      'breedOriginCategoryResponse': this.breedOriginCategoryResponse,
    };
  }

  factory CategoryBreedOriginGet.fromMap(Map<String, dynamic> map) {
    return CategoryBreedOriginGet(
      breedOriginCategoryResponse:BreedOriginCategoryResponse.fromJson(map['breedOriginCategoryResponse'] as Map<String,dynamic>),
    );
  }
}