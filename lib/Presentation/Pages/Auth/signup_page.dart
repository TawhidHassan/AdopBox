import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/TextField/bg_textfield.dart';
import '../../Widgets/TextField/password_bg_textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorx,
      appBar: AppBar(
        backgroundColor: kPrimaryColorx,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.close,color: Colors.white,size: 32.sp,),
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
                        Text("Create an account",style: boldText(24.sp,color: whiteBackground),),
                        SizedBox(height: 4.h,),
                        Text("Create an account to see your profile, chats, write blogs or post your ads",style: regularText(14.sp,color: whiteBackground),textAlign: TextAlign.start,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 20.h,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your email", style: mediumText(16.sp,),),
                            SizedBox(height: 4.h,),
                            BackgroundTextfield(
                              controller: null,
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
                            Text("password", style: mediumText(16.sp,),),
                            SizedBox(height: 4.h,),
                            PasswordTextfield(
                              controller: null,
                              readOnly: false,
                              isNumber: false,
                              hintText: "password",
                              bgColor: whiteBackground,
                              borderColor: borderColor, lable: '',)
                          ],
                        ),
                        SizedBox(height: 24.h,),
                        CustomButton(
                            height: 48.h,
                            borderRadius: 4,
                            color: kPrimaryColorx,
                            textColor: Colors.white,
                            boder: false,
                            title: "Sent OPT",
                            onTap: () {
                              Navigator.pushNamed(context, OTP_PAGE);

                            }),

                        SizedBox(height: 32.h,),
                        SizedBox(
                          width: 1.0.sw,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Divider(color: dividerColor,thickness: 1,)
                              ),
                              SizedBox(width: 12.w,),
                              Expanded(
                                  child: Text("or continue with",style: mediumText(14.sp,color: textColor),),
                              ),
                              SizedBox(width: 12.w,),
                              Expanded(
                                  child: Divider(color: dividerColor,thickness: 1,)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h,),
                        CustomButton(
                            height: 48.h,
                            borderRadius: 4,
                            color: kPrimaryColorx,
                            textColor: Colors.white,
                            boder: true,
                            title: "Continue with google",
                            onTap: () {

                            }),
                        SizedBox(height: 32.h,),
                        InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, LOGIN_PAGE);
                            },
                            child: Text("Already have an account? Sign in",style: semiBoldText(16.sp,color: textColor),textAlign: TextAlign.center,))

                      ],
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
}
