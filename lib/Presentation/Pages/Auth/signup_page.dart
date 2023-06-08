import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/AuthController/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../../Data/Model/Auth/SignupResponse.dart';
import '../../../Dependenci Injection/injection.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/Loading/loading_widget.dart';
import '../../Widgets/TextField/bg_textfield.dart';
import '../../Widgets/TextField/password_bg_textfield.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final _globalkey = GlobalKey<FormState>();
  TextEditingController nameTextController = new TextEditingController();
  TextEditingController phoneTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();
  TextEditingController emailTextController = new TextEditingController();
  var localBd=getIt<LocalDataGet>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorx,
      appBar: AppBar(
        backgroundColor: kPrimaryColorx,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: Colors.white, size: 32.sp,),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 1.0.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Create an account",
                          style: boldText(24.sp, color: whiteBackground),),
                        SizedBox(height: 4.h,),
                        Text(
                          "Create an account to see your profile, chats, write blogs or post your ads",
                          style: regularText(14.sp, color: whiteBackground),
                          textAlign: TextAlign.start,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )
                    ),
                    child: Form(
                      key: _globalkey,
                      child: ListView(
                        children: [
                          SizedBox(height: 20.h,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your name", style: mediumText(16.sp,),),
                              SizedBox(height: 4.h,),
                              BackgroundTextfield(
                                controller: nameTextController,
                                readOnly: false,
                                isNumber: false,
                                isemail: false,
                                height: 48.h,
                                hintText: "Name",
                                bgColor: whiteBackground,
                                errormsg: "Please enter name",
                                borderColor: borderColor,)
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your email", style: mediumText(16.sp,),),
                              SizedBox(height: 4.h,),
                              BackgroundTextfield(
                                controller: emailTextController,
                                readOnly: false,
                                isNumber: false,
                                isemail: true,
                                height: 48.h,
                                hintText: "email",
                                bgColor: whiteBackground,
                                errormsg: "Please enter email",
                                borderColor: borderColor,)
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your Phone Number",
                                style: mediumText(16.sp,),),
                              SizedBox(height: 4.h,),
                              BackgroundTextfield(
                                controller: phoneTextController,
                                readOnly: false,
                                isNumber: true,
                                isemail: false,
                                height: 48.h,
                                hintText: "email",
                                bgColor: whiteBackground,
                                errormsg: "Please enter email",
                                borderColor: borderColor,)
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("password", style: mediumText(16.sp,),),
                              SizedBox(height: 4.h,),
                              PasswordTextfield(
                                controller: passwordTextController,
                                readOnly: false,
                                isNumber: false,
                                hintText: "password",
                                bgColor: whiteBackground,
                                borderColor: borderColor,
                                lable: '',)
                            ],
                          ),
                          SizedBox(height: 24.h,),
                          GetBuilder<AuthController>(
                            assignId: true,
                            builder: (controller) {
                              return Obx(() {
                                return  controller.circuler.value?LoadingWidget():CustomButton(
                                    height: 48.h,
                                    borderRadius: 4,
                                    color: kPrimaryColorx,
                                    textColor: Colors.white,
                                    boder: false,
                                    title: "SignUp",
                                    onTap: () {
                                        if (_globalkey.currentState!.validate()) {
                                          signupFun(controller,context);
                                        }

                                    });
                              });
                            },
                          ),

                          SizedBox(height: 32.h,),

                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, LOGIN_PAGE);
                              },
                              child: Text("Already have an account? Sign in",
                                style: semiBoldText(16.sp, color: textColor),
                                textAlign: TextAlign.center,))

                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          )

        ],
      ),
    );
  }

  Future<SignupResponse?> signupFun(AuthController controller, BuildContext context) async {
    var value = controller.SignUp(name: nameTextController.text,
        mobile: phoneTextController.text, email: emailTextController.text, pasword: passwordTextController.text!).then((value) async {
      // Logger().w(value!.statusCode);
      if (value!.status=="success") {

        await localBd.storeTokenUserdata(
          email: value.user!.email,
          token: value.token,
            name: value.user!.fullName,
            phone: value.user!.phoneNumber,
            ).then((value) => Navigator.pushReplacementNamed(context, MAIN_PAGE));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: SizedBox(
            height:24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value.message!, style: mediumText(14.sp, color: Colors.white),),
              ],
            ),
          ),
          duration: Duration(milliseconds: 3000),
        ));
        // Navigator.pushReplacementNamed(context, SIGNUP_SUCESS_PAGE);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: SizedBox(
            height:24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value.message!, style: mediumText(14.sp, color: Colors.white),),
              ],
            ),
          ),
          duration: Duration(milliseconds: 3000),
        ));
      }
    });
    return value;
  }
}
