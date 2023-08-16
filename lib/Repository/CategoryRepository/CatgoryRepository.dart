import 'dart:io';



import 'package:AdopBox/Bloc/CategoryBreedOrigin/category_breed_origin_cubit.dart';
import 'package:AdopBox/Data/Model/Category/BreedOriginCategoryResponse.dart';
import 'package:AdopBox/Data/Model/Category/CategoryResponse.dart';
import 'package:logger/logger.dart';

import '../../Data/Model/Auth/SignupResponse.dart';
import '../../Dependenci Injection/injection.dart';
import '../../Network/api_client.dart';

class CategoryRepository{



  Future<CategoryResponse> getCategory() async{
    final userRaw=await  getIt<ApiClient>().getData(uri: "api/v1/category/get-categories?skip=0&limit=",);

    return CategoryResponse.fromJson(userRaw);
  }


  Future<BreedOriginCategoryResponse> getCategoryBreedOrigin() async{
    final userRaw=await  getIt<ApiClient>().getData(uri: "api/v1/get-all-data",);

    Logger().i(userRaw);
    return BreedOriginCategoryResponse.fromJson(userRaw);
  }

 // Future<UserRresponseUpdate> upDatProfile(String? firstName,String? lastName, String? name, String? number, File? file)async {
 //   Map<String, String> data = {
 //     'firstname': firstName!,
 //     'lastname': lastName!,
 //     'mobile': number!,
 //     'language': 'en'
 //   };
 //   final userRaw=await  getIt<ApiClient>().postMultipartData(
 //       uri: "user/update-profile",
 //       body: data,
 //       multipartBody:file==null?[]: [
 //         MultipartBody('profile_image', file)
 //       ]
 //   );
 //
 //   return UserRresponseUpdate.fromJson(userRaw);
 // }
 //
 //
 //  Future<ForgetPasswordResponse>  passwordChange(String old, String newP, String confrim) async{
 //    Map<String, String> data = {
 //      'password': newP,
 //      'password_confirmation': confrim,
 //      'old_password': old,
 //    };
 //
 //    final userRaw=await  getIt<ApiClient>().postData(uri: "auth/change-password", body: data);
 //
 //    return ForgetPasswordResponse.fromJson(userRaw);
 //  }
}