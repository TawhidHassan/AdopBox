
import 'dart:io';


import 'package:AdopBox/Data/Model/Category/CategoryResponse.dart';
import 'package:AdopBox/Repository/CategoryRepository/CatgoryRepository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import '../../Config/text_style.dart';
import '../../Data/Model/Auth/SignupResponse.dart';
import '../../Getx Injection/getx_dependenci_injection.dart' as di;

import '../../Data/Model/Location/location_model.dart';
import '../../Dependenci Injection/injection.dart';
import '../../Network/api_client.dart';
import '../../Repository/AuthRepository/AuthRepository.dart';
import 'package:image/image.dart' as Img;


class CategoryController extends GetxController implements GetxService{
  final CategoryRepository? categoryRepository;
  CategoryController({ this.categoryRepository});

    final circuler=false.obs;
    final selectall=false.obs;
    final categoriesList=[].obs;
    final updateCirculer=false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    categoriesList.value=[];

    /*if(countDownTimer!.isBroadcast){
      countDownTimer!.cancel();
    }*/
    super.onInit();
  }

  Rx<CategoryResponse?> categoryResponse=Rx<CategoryResponse?>(null);
  Future getCategory() async{
       circuler.value=true;

      await categoryRepository?.getCategory().then((value){
        circuler.value=false;
        categoryResponse.value=value;
      });

  }


  void CategorySelec(int index) {
    updateCirculer.value=!updateCirculer.value;
    if (categoriesList.value.contains(categoryResponse.value!.getData![index].id)) {
      categoriesList.value.remove(categoryResponse.value!.getData![index].id);
    } else {
      categoriesList.value.add(categoryResponse.value!.getData![index].id);
    }

    print(categoriesList.value);

    update();

  }

 // Future<OtpResponse?> OtpSent({required String email}) async{
 //    circuler.value=true;
 //    OtpResponse? data;
 //   await authRepository?.OtpGet(email).then((value){
 //     circuler.value=false;
 //     data=value;
 //     Logger().w(data!.message!);
 //   });
 //    return data!;
 //  }




  // Rx<UserResponse?> userResponse=Rx<UserResponse?>(null);
  // Future<UserResponse?> getProfileData() async{
  //   circuler.value=true;
  //
  //   await authRepository?.getProfileData().then((value){
  //     circuler.value=false;
  //     userResponse.value=value;
  //     fisrtname.value=value.data!.userProfile!.firstname!;
  //     lastName.value=value.data!.userProfile!.lastname!;
  //     name.value=value.data!.user!.name!;
  //     number.value=value.data!.userProfile!.mobile!;
  //     image.value=value.data!.userProfile!.photo??"";
  //   });
  //   return userResponse.value;
  // }




  // void upDatProfile(String? fisrtNamex,String? lastNamex, String? namex, String? numberx,BuildContext context) async{
  //   updateCirculer.value=true;
  //   await authRepository?.upDatProfile(fisrtNamex!.isEmpty?fisrtname.value:fisrtNamex,
  //       lastNamex!.isEmpty?lastName.value:lastNamex,namex!.isEmpty?name.value:namex,
  //       numberx!.isEmpty?number.value:numberx,file).then((value){
  //     updateCirculer.value=false;
  //    if(value.success!){
  //      getProfileData();
  //      // Get.snackbar("Update Profile", value.message!);
  //      Get.snackbar("", "",
  //          backgroundColor: Color(0XFF0EA01D),
  //          borderRadius: 4,
  //          titleText: Text("Successfully",style: mediumText(14,color: Colors.white),),
  //          messageText: Text(value.message!,style: mediumText(14,color: Colors.white),),
  //          icon: Image.asset("assets/icons/done2.png"),
  //          colorText: Colors.white,
  //          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
  //          duration: Duration(seconds: 2)
  //      );
  //      Box? users= Hive.box('users');
  //      value.data!.photo!=null?
  //      users.put("image", value.data!.photo):null;
  //      users.put("firstName", value.data!.firstname!);
  //      users.put("phone", value.data!.mobile!);
  //      users.put("lastName", value.data!.lastname).then((value){
  //        Navigator.pushReplacementNamed(context, MAIN_PAGE,);
  //      });
  //
  //    }else{
  //      Get.snackbar("Update Profile", value.message!);
  //    }
  //   });
  // }



}