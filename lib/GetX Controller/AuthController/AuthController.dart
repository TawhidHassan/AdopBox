
import 'dart:io';


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


class AuthController extends GetxController implements GetxService{
  final AuthRepository? authRepository;
  AuthController({ this.authRepository});

    final circuler=false.obs;
    final updateCirculer=false.obs;
    final otpText="".obs;

  final count = 0.obs;
  Rx<LocationModel?>  location=Rx<LocationModel?>(null);
  increment() {
    count.value++;
    authRepository!.getCheck();
  }
  final fisrtname="".obs;
  final lastName="".obs;
  final name="".obs;
  final number="".obs;
  final image="".obs;
  @override
  void onInit() {
    otpText.value="";
    fisrtname.value="";
    lastName.value="";
     name.value="";
     number.value="";
     image.value="";
     filePath.value="";
    super.onInit();
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


  Future<SignupResponse?> SignUp({required String name,
    required String mobile, required String email, required String pasword}) async{
    circuler.value=true;
    SignupResponse? data;
   await authRepository?.SignUp(name,mobile,email,pasword).then((value){
     circuler.value=false;
     data=value;
     injection();
     Logger().w(data!.message!);
   });
    return data!;
  }

  Future<SignupResponse?>  signinFun({required String email, required String pasword}) async{
    circuler.value=true;
    SignupResponse? data;
    await authRepository?.signinFun(email,pasword).then((value) async {
      circuler.value=false;
      data=value;
      ///update bearer token in api client
      ///update dependencies
      injection();
      // await di.init();
      Logger().w(data!.message!);
    });
    return data!;
  }

  Future<SignupResponse?> resetPassword({String? email,String? password,String? otp}) async{
    circuler.value=true;
    SignupResponse? data;
    await authRepository?.resetPassword(email!,password!,otp!).then((value){
      circuler.value=false;
      data=value;
      Logger().w(value.message);
    });
    return data!;
  }

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
  final filePath="".obs;
  File? file;

  filepic()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      filePath.value="";
      File filer = File(result.files.single.path!);
      filePath.value=result.files.single.path!;
      file=filer;
      reduceImageSize(file!);

    } else {
      // User canceled the picker
    }
  }
  Future<File> reduceImageSize(File imageFile) async {
    Img.Image? image = Img.decodeImage(imageFile.readAsBytesSync());
    int width = image!.width;
    int height = image.height;
    if (width > 800 || height > 800) {
      double aspectRatio = width / height;
      if (width > height) {
        width = 800;
        height = (width / aspectRatio).round();
      } else {
        height = 800;
        width = (height * aspectRatio).round();
      }
      image = Img.copyResize(image, width: width, height: height);
    }
    File reducedFile = File(imageFile.path.replaceAll('.jpg', '_reduced.jpg'));
    reducedFile.writeAsBytesSync(Img.encodeJpg(image, quality: 75));
    file=reducedFile;
    return reducedFile;
  }



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


  // Future<ForgetPasswordResponse?> passwordChange(String old, String newP, String confrim)  async{
  //   circuler.value=true;
  //   ForgetPasswordResponse? data;
  //   await authRepository?.passwordChange(old,newP,confrim).then((value){
  //     circuler.value=false;
  //     data=value;
  //     Logger().w(value.success);
  //   });
  //   return data!;
  // }
}