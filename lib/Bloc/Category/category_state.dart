part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryGet extends CategoryState {
  final CategoryResponse? categoryResponse;

  CategoryGet({this.categoryResponse});

  Map<String, dynamic> toMap() {
    return {
      'categoryResponse': this.categoryResponse,
    };
  }

  factory CategoryGet.fromMap(Map<String, dynamic> map) {
    return CategoryGet(
      categoryResponse:CategoryResponse.fromJson(map['categoryResponse'] as Map<String,dynamic>),
    );
  }
}