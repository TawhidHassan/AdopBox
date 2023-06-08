import 'dart:io';



import 'package:AdopBox/Data/Model/Image/ImageResponse.dart';
import 'package:AdopBox/Data/Model/PostCreate/PostCreate.dart';

import '../../Data/Model/Auth/SignupResponse.dart';
import '../../Dependenci Injection/injection.dart';
import '../../Network/api_client.dart';

class PostRepository{

  Future getCheck()async{
    getIt<ApiClient>().getData(uri: "target/last-sevenday-data");
    // apiClient.getData(uri: "target/last-sevenday-data",headers: {"xxx":"xxxx"});
  }


 Future<ImageResponse> ImageUpload(File? file)async {
   Map<String, String> data = {

   };
   final userRaw=await  getIt<ApiClient>().postMultipartData(
       uri: "api/v1/category/image-upload",
       body: data,
       multipartBody:file==null?[]: [
         MultipartBody('photo', file)
       ]
   );

   return ImageResponse.fromJson(userRaw);
 }

  Future submitPost(PostCreate? darftPostModel) async{

    final userRaw=await  getIt<ApiClient>().postData(
        uri: "api/v1/post/create-post",
        body: darftPostModel!.toMap(),

    );

    return userRaw;
  }
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