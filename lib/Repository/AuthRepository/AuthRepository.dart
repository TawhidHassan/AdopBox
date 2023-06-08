import 'dart:io';



import '../../Data/Model/Auth/SignupResponse.dart';
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

  Future<SignupResponse> resetPassword(String email,String password,String otp) async{
    Map<String, String> data = {
      "newPassword":password,
      "otp":otp,
      "recipient":email
    };

    final userRaw=await  getIt<ApiClient>().postData(uri: "user/v1/forgot-password", body: data);

    return SignupResponse.fromJson(userRaw);
  }
 //
 //  Future<UserResponse> getProfileData() async{
 //    final userRaw=await  getIt<ApiClient>().getData(uri: "user/profile",);
 //
 //    return UserResponse.fromJson(userRaw);
 //  }
 //
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