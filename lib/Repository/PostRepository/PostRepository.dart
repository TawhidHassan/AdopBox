import 'dart:io';



import 'package:AdopBox/Data/Model/Image/ImageResponse.dart';
import 'package:AdopBox/Data/Model/Post/SinglePostResponse.dart';
import 'package:AdopBox/Data/Model/PostCreate/PostCreate.dart';
import 'package:AdopBox/Data/Model/User/UserResponse.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:logger/logger.dart';

import '../../Data/Model/Auth/SignupResponse.dart';
import '../../Data/Model/Category/BreedOriginCategoryResponse.dart';
import '../../Data/Model/Post/PostResponse.dart';
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

  Future<PostResponse?> getRecentPost(Rx<LatLng?> latLng, RxDouble radius, String location, List<String> categoryList, int limit)async {

   String queryParam = categoryList.map((e) => "category=$e").join("&");
    final userRaw=await  getIt<ApiClient>().getData(
        uri: "api/v1/post/get-post?"
            "lat="+latLng.value!.latitude.toString()+
            "&long="+latLng.value!.longitude.toString()+
            "&location="+location+
            "&maxDistance="+radius.value.toString()+
            "&limit="+limit.toString()+
            "&"+queryParam

    );
    // Logger().i(userRaw);
    return PostResponse.fromJson(userRaw);
  }

  Future<SinglePostResponse?> getPostDetails(String? id) async{
    final userRaw=await  getIt<ApiClient>().getData(
        uri: "api/v1/post/get-single-post/"+id!

    );
    Logger().i(userRaw);
    return SinglePostResponse.fromJson(userRaw);
  }

  Future<PostResponse?> getRelated(String? id, String? catId) async{
    final userRaw=await  getIt<ApiClient>().getData(
        uri: "api/v1/post/get-related-posts/"+id!+"/"+catId!

    );
    Logger().i(userRaw);
    return PostResponse.fromJson(userRaw);
  }

  Future<PostResponse?> getAllPost(LatLng? latlon, double radius, String catId,String postType,
      String minPrice, String maxPrice,String page,String limit) async{

    final userRaw=await  getIt<ApiClient>().getData(
        uri: "api/v1/post/get-filtered-data?lat="+latlon!.latitude.toString()+
            "&long="+latlon.longitude.toString()+
            "&maxDistance="+radius.toString()+
            "&category="+catId+
            "&postType="+postType+
            "&minPrice="+minPrice+
            "&maxPrice="+maxPrice+
            "&page="+page+
            "&limit="+limit
    );
    // Logger().i(userRaw);
    return PostResponse.fromJson(userRaw);
  }


  Future<PostResponse?> getMyFavoraitPost() async{
    final userRaw=await  getIt<ApiClient>().getData(
        uri: "api/v1/post/get-list-of-favourite-post"

    );
    Logger().i(userRaw);
    return PostResponse.fromJson(userRaw);
  }


  Future<UserResponse?>  setFavouraitePost(String? id) async{
    final userRaw=await  getIt<ApiClient>().patchData(
        uri: "api/v1/post/set-post-favourite/"+id!,
      body: []

    );
    Logger().i(userRaw);
    return UserResponse.fromJson(userRaw);
  }
  Future<UserResponse?>  removeFavouraitePost(String? id) async{
    final userRaw=await  getIt<ApiClient>().patchData(
        uri: "api/v1/post/remove-post-favourite/"+id!,
        body: []

    );
    Logger().i(userRaw);
    return UserResponse.fromJson(userRaw);
  }



  Future<PostResponse?> getMyPost(String id) async{
    final userRaw=await  getIt<ApiClient>().getData(
        uri: "api/v1/post/get-post?postUser="+id
    );
    Logger().i(userRaw);
    return PostResponse.fromJson(userRaw);
  }

  Future<BreedOriginCategoryResponse> getCategoryBreedOrigin() async{
    final userRaw=await  getIt<ApiClient>().getData(uri: "api/v1/get-all-data",);

    Logger().i(userRaw);
    return BreedOriginCategoryResponse.fromJson(userRaw);
  }


}