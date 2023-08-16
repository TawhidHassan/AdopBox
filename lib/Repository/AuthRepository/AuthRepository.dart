import 'dart:io';



import 'package:logger/logger.dart';

import '../../Data/Model/Auth/SignupResponse.dart';
import '../../Data/Model/User/UserResponse.dart';
import '../../Dependenci Injection/injection.dart';
import '../../Network/api_client.dart';

class AuthRepository{

  Future getCheck()async{
    getIt<ApiClient>().getData(uri: "target/last-sevenday-data");
    // apiClient.getData(uri: "target/last-sevenday-data",headers: {"xxx":"xxxx"});
  }

  // Future<OtpResponse?> OtpGet( String email)async {
  //
  //   Map<String, String> data = {
  //     'recipient': email,
  //   };
  //
  //   final userRaw=await  getIt<ApiClient>().postData(uri: "otp/v1/send", body: data);
  //
  //   return OtpResponse.fromJson(userRaw);
  // }
  Future<SignupResponse?> SignUp(String name, String mobile, String email, String pasword)async {

    Map<String, String> data = {
      "email": email,
      "fullName": name,
      "phoneNumber": mobile,
      "password": pasword
    };

    final userRaw=await  getIt<ApiClient>().postData(uri: "api/v1/user/user-registration", body: data);

    return SignupResponse.fromJson(userRaw);
  }

  Future<SignupResponse?> signinFun(String email, String pasword) async{
    Map<String, String> data ={
      "email": email,
      "password": pasword
    };

    final userRaw=await  getIt<ApiClient>().postData(uri: "api/v1/user/login", body: data);

    return SignupResponse.fromJson(userRaw);
  }

  Future<SignupResponse> resetPassword(String newPass,String oldPass) async{
    Map<String, String> data = {
      "currentPassword": oldPass,
      "newPassword": newPass
    };

    final userRaw=await  getIt<ApiClient>().patchData(uri: "api/v1/user/pass-update", body: data);

    return SignupResponse.fromJson(userRaw);
  }
  Future<UserResponse> getUserData() async{


    final userRaw=await  getIt<ApiClient>().getData(uri: "api/v1/user/get-me");

    Logger().w(userRaw);
    return UserResponse.fromJson(userRaw);
  }

 //
 //  Future<UserResponse> getProfileData() async{
 //    final userRaw=await  getIt<ApiClient>().getData(uri: "user/profile",);
 //
 //    return UserResponse.fromJson(userRaw);
 //  }
 //
 Future<UserResponse> upDatProfile(
     {String? name,
      String? gender,
      String? bod,
      String? number,
      File? file})async {
   Map<String, String> data = {
     "fullName": name!,
     "phoneNumber": number!,
     "gender":gender!,
     "dob": bod!
   };
   final userRaw=await  getIt<ApiClient>().patchData(
       uri: "api/v1/user/profile-update",
       body: data,

   );

   Logger().w(userRaw);
   return UserResponse.fromJson(userRaw);
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