import 'package:AdopBox/Data/Model/Category/BreedOriginCategoryResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/CategoryRepository/CatgoryRepository.dart';

part 'category_breed_origin_state.dart';

class CategoryBreedOriginCubit extends Cubit<CategoryBreedOriginState>with HydratedMixin {
  CategoryBreedOriginCubit() : super(CategoryBreedOriginInitial());

  var categoryRepo =Get.find<CategoryRepository>();


  void getCategoryBreedOrigin() {
    categoryRepo.getCategoryBreedOrigin().then((value){
      if(value!=null){
        emit(CategoryBreedOriginGet(breedOriginCategoryResponse: value));
      }
    });

  }

  @override
  CategoryBreedOriginState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return CategoryBreedOriginGet.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CategoryBreedOriginState state) {
    // TODO: implement toJson
    if (state is CategoryBreedOriginGet) {
      return state.toMap();
    } else {
      return null;
    }
  }

}
