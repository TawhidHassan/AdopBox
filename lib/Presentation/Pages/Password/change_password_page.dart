import 'package:AdopBox/GetX%20Controller/AuthController/AuthController.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Config/text_style.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/TextField/password_bg_textfield.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  TextEditingController oldPassEdit=TextEditingController();
  TextEditingController newPassEdit=TextEditingController();
  TextEditingController confirmPassEdit=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: AppBar(
              title: Text("Change password"),
            ),
            bottomSheet: Container(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
              height: 65,
              child:controller.circuler.value?LoadingWidget(): CustomButton(
                  height: 48,
                  borderRadius: 4,
                  color: kPrimaryColorx,
                  textColor: Colors.white,
                  boder: false,
                  title: "Change Password",
                  onTap: () {
                    if(confirmPassEdit.text==newPassEdit.text){
                      controller.resetPassword(newPass: newPassEdit.text,oldPass: oldPassEdit.text);
                    }else{
                      Get.snackbar("Password Not Match", 'Check New And Confirm Password');
                    }
                  }),
            ),

            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Old password", style: mediumText(16.sp,),),
                      SizedBox(height: 4.h,),
                      PasswordTextfield(
                        controller: oldPassEdit,
                        readOnly: false,
                        isNumber: false,
                        hintText: "Old password",
                        bgColor: whiteBackground,
                        borderColor: borderColor,
                        lable: '',)
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New password", style: mediumText(16.sp,),),
                      SizedBox(height: 4.h,),
                      PasswordTextfield(
                        controller: newPassEdit,
                        readOnly: false,
                        isNumber: false,
                        hintText: "New password",
                        bgColor: whiteBackground,
                        borderColor: borderColor,
                        lable: '',)
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Confirm password", style: mediumText(16.sp,),),
                      SizedBox(height: 4.h,),
                      PasswordTextfield(
                        controller: confirmPassEdit,
                        readOnly: false,
                        isNumber: false,
                        hintText: "Confirm password",
                        bgColor: whiteBackground,
                        borderColor: borderColor,
                        lable: '',)
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
