import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Button/custom_button.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("OTP Verifications"),
      ),
      body: Container(
        width: 1.0.sw,
        height: 1.0.sh,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("We have sent a verification code to",style: mediumText(16.sp,color: textColor),),
            Text("pjitbanik@gmail.com",style: boldText(16.sp,color: textColor),),
            SizedBox(height: 30.h,),
            Center(
              child: Form(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 40),
                    child: PinCodeTextField(
                      backgroundColor: Colors.transparent,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: false,
                      obscuringCharacter: '*',
                      // obscuringWidget: FlutterLogo(
                      //   size: 24,
                      // ),
                      blinkWhenObscuring: false,
                      animationType: AnimationType.fade,
                      validator: (v) {

                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(4),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        selectedColor: kPrimaryColorx,
                        inactiveColor: unSelectColor,
                        inactiveFillColor: Colors.white,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: null,
                      keyboardType: TextInputType.number,

                      onCompleted: (v) {
                        print(v+"complete");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print("print otp "+value);


                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc

                        return true;
                      },
                    )),
              ),
            ),
            SizedBox(height: 30.h,),
            CustomButton(
                height: 48.h,
                borderRadius: 4,
                color: kPrimaryColorx,
                textColor: Colors.white,
                boder: false,
                title: "Continue",
                onTap: () {
                  Navigator.pushNamed(context, PERSONAL_INFO_PAGE);

                }),
            SizedBox(height: 24.h,),
            InkWell(
                onTap: (){
                  // Navigator.pushNamed(context, LOGIN_PAGE);
                },
                child: Text("Didn’t receive code. Resend",style: semiBoldText(16.sp,color: textColor),textAlign: TextAlign.center,))

          ],
        ),
      ),
    );
  }
}
