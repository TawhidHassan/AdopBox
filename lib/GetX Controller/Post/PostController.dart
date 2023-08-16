


import 'dart:convert';

import 'package:AdopBox/Data/Model/Post/Post.dart';
import 'package:AdopBox/Data/Model/Post/PostResponse.dart';
import 'package:AdopBox/Data/Model/Post/SinglePostResponse.dart';
import 'package:AdopBox/GetX%20Controller/Home/HomeController.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

import '../../Data/Model/Category/CategoryResponse.dart';
import '../../Data/Model/User/UserResponse.dart';
import '../../Dependenci Injection/injection.dart';
import '../../Repository/PostRepository/PostRepository.dart';
import '../../Service/LocalDataBase/localdata.dart';
import '../../service/location_service_name.dart';

class PostController extends GetxController implements GetxService {
  final LocalDataGet? localDataGet;
  final PostRepository? postRepository;
  PostController({this.localDataGet, this.postRepository});

@override
  void onInit() {
    // TODO: implement onInit
  getToken();
  adress.value="Getting Location";
  relatedPostResponse.value=null;
  singlePost.value=null;
    super.onInit();
  }


  void getToken() async{
    var tokenx = await getIt<LocalDataGet>().getData();
    if(tokenx.get('token')!=null){

        userId.value=tokenx.get('userId');

      Logger().e(tokenx.get('name'));
    }
  }

  var locationNameService = getIt<LocationNameService>();
  final adress="Getting Location".obs;
  final userId="".obs;
  final circuler=false.obs;
  final myFavPostCirculer=false.obs;


  Rx<PostResponse?> postResponse=Rx<PostResponse?>(null);
  void getRecentPost()async {
    String stringList = await localDataGet!.getCatgoryItem();
    List<dynamic> decodedList = jsonDecode(stringList);
    List<String> resultList = List<String>.from(decodedList);
    circuler.value=true;
    postResponse.value=null;
    postRepository!.getRecentPost(
        Get.find<HomeController>().latLng,
        Get.find<MapController>().radius,
        "yes",
        resultList,
        4).then((value){
      circuler.value=false;
      postResponse.value=value;
    });
  }


  final psotDetailsCirculer=false.obs;
  final relatedCirculer=false.obs;
  Rx<SinglePostResponse?> singlePost=Rx<SinglePostResponse?>(null);
  Rx<PostResponse?> relatedPostResponse=Rx<PostResponse?>(null);
  void getPostDetails(String? id) {
    psotDetailsCirculer.value=true;
    singlePost.value=null;
    postRepository!.getPostDetails(id).then((value){
      psotDetailsCirculer.value=false;
      singlePost.value=value;
      locationName();
    });

  }


  String? locationName(){

    locationNameService.getLocationName(singlePost.value!.getData!.location!.coordinates![1].toDouble(), singlePost.value!.getData!.location!.coordinates![0].toDouble()).then((valuex){
      adress.value=valuex![0].locality.toString() +
          "," +
          valuex[0].subLocality.toString();
      Logger().d(adress.value);
      return adress.value;
    });
  }

  void getRelated(String? id, String? catId) {
    relatedCirculer.value=true;
    relatedPostResponse.value=null;
    postRepository!.getRelated(id,catId).then((value){
      relatedCirculer.value=false;
      relatedPostResponse.value=value;
    });
  }

  Rx<PostResponse?> myFavPostResponse=Rx<PostResponse?>(null);
  void getMyFavoraitPost() {
    myFavPostCirculer.value=true;
    myFavPostResponse.value=null;
    postRepository!.getMyFavoraitPost().then((value){
      myFavPostCirculer.value=false;
      myFavPostResponse.value=value;
    });
  }


  ///===========================================================================
  final allPostCirculer=false.obs;
  final categoryId="".obs;
  final categorySelect="".obs;
  var postType="";
  final minumPrice="".obs;
  final maximumPrice="".obs;
  Rx<CategoryResponse?> categoryResponse=Rx<CategoryResponse?>(null);
  ///=========All Post with pagination========///////

  List<Post> list = [];
  ScrollController controller = ScrollController();
  int listLength = 10;
  int page = 0;
  final postPagingCirculer=false.obs;
  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        listLength++;
        page++;
        Logger().e(page);
        getPostPagingData(page: page.toString());
        update();
      }
    });
  }
 Future getAllPost({String? idx, String? pagex}) async{
    allPostCirculer.value=true;
    list.clear();
    page=0;
    addItems();

    await postRepository!.getAllPost(
        Get.find<HomeController>().latLng.value,
        Get.find<MapController>().radius.value,
        categoryId.value,
        postType,
        minumPrice.value,
        maximumPrice.value,
        "0",
        "6"
    ).then((value){
      allPostCirculer.value=false;
      // categoryCourseResponse.value=value;
      for(var i=0;i<value!.getData!.length;i++){
        list.add(value.getData![i]);
      }
      Logger().w(list.length);
    });
  }
 Future getPostPagingData({String? page}) async{
    postPagingCirculer.value=true;
    await postRepository!.getAllPost(
        Get.find<HomeController>().latLng.value,
        Get.find<MapController>().radius.value,
        categoryId.value,
        postType,
        minumPrice.value,
        maximumPrice.value,
        page??"0",
        "6"
    ).then((value){
      for(var i=0;i<value!.getData!.length;i++){
        list.add(value.getData![i]);
      }
      update();
      postPagingCirculer.value=false;
      Logger().w(page);
    });

  }

  ///=========All Post with pagination========///////
  updateType(int num){
    if(num==1){
      postType="1";
    }else if(num==2){
      postType="2";
    }else{
      postType="";
    }
    Get.find<PostController>().getAllPost();
    update();
  }


  Rx<UserResponse?> userResponse=Rx<UserResponse?>(null);
  final favouriteCirculer=false.obs;
  Future setFavouraitePost(String? id)async {
    favouriteCirculer.value=true;
    userResponse.value=null;
    await postRepository!.setFavouraitePost(id).then((value){
      favouriteCirculer.value=false;
    userResponse.value=value;
    });
  }
  Future removeFavouraitePost(String? id)async {
    favouriteCirculer.value=true;
    userResponse.value=null;
    await postRepository!.removeFavouraitePost(id).then((value){
      favouriteCirculer.value=false;
    userResponse.value=value;
    });
  }



  final myPostCirculer=false.obs;
  Rx<PostResponse?> myPostResponse=Rx<PostResponse?>(null);
  void getMyPost() {
    myPostCirculer.value=true;
    myPostResponse.value=null;
    postRepository!.getMyPost(userId.value).then((value){
      myPostCirculer.value=false;
      myPostResponse.value=value;
    });
  }

}