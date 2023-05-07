import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/TextField/bg_textfield.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Forget password"),
      ),
      body: Container(
        width: 1.0.sw,
        height: 1.0.sh,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("No problem: please enter the e-mail address you use to login to adop box",style: mediumText(16.sp,color: textColor),),
            SizedBox(height: 24.h,),
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
                  hintText: "Type your email",
                  bgColor: whiteBackground,
                  errormsg: "Please enter email",
                  borderColor: borderColor,)
              ],
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
        bottomSheet:Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 8),
          height: 80.h,
          child: CustomButton(
              height: 48.h,
              borderRadius: 4,
              color:kPrimaryColorx,
              textColor: Colors.white,
              title: "Continue",
              onTap: () {
                Navigator.pushNamed(context,OTP_PAGE );
              }),

        )
    );
  }
}
