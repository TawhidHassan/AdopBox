import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Config/text_style.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../Widgets/TextField/password_bg_textfield.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change password"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Old password", style: mediumText(16.sp,),),
                SizedBox(height: 4.h,),
                PasswordTextfield(
                  controller: null,
                  readOnly: false,
                  isNumber: false,
                  hintText: "Old password",
                  bgColor: whiteBackground,
                  borderColor: borderColor, lable: '',)
              ],
            ),
            SizedBox(height: 20.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New password", style: mediumText(16.sp,),),
                SizedBox(height: 4.h,),
                PasswordTextfield(
                  controller: null,
                  readOnly: false,
                  isNumber: false,
                  hintText: "New password",
                  bgColor: whiteBackground,
                  borderColor: borderColor, lable: '',)
              ],
            ),
            SizedBox(height: 20.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Confirm password", style: mediumText(16.sp,),),
                SizedBox(height: 4.h,),
                PasswordTextfield(
                  controller: null,
                  readOnly: false,
                  isNumber: false,
                  hintText: "Confirm password",
                  bgColor: whiteBackground,
                  borderColor: borderColor, lable: '',)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
