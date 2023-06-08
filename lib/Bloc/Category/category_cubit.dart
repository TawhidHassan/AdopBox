import 'package:AdopBox/Data/Model/Category/CategoryResponse.dart';
import 'package:AdopBox/Repository/CategoryRepository/CatgoryRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../../Dependenci Injection/injection.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState>with HydratedMixin {
  CategoryCubit() : super(CategoryInitial());
  var categoryRepo =Get.find<CategoryRepository>();


  void getCategory() {
    categoryRepo.getCategory().then((value){
      if(value!=null){
        emit(CategoryGet(categoryResponse: value));
      }
    });

  }

  @override
  CategoryState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return CategoryGet.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CategoryState state) {
    // TODO: implement toJson
    if (state is CategoryGet) {
      return state.toMap();
    } else {
      return null;
    }
  }

}
