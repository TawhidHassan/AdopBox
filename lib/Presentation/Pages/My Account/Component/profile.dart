import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../../GetX Controller/AuthController/AuthController.dart';
import '../../../Widgets/Button/custom_button.dart';
import '../../../Widgets/TextField/bg_textfield.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>().getUserData();
    return GetBuilder<AuthController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return controller.circuler.value?LoadingWidget():
          ListView(
            children: [
              SizedBox(height: 20.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your name", style: mediumText(16.sp,),),
                  SizedBox(height: 4.h,),
                  BackgroundTextfield(
                    controller: null,
                    readOnly: true,
                    isNumber: false,
                    isemail: false,
                    height: 48.h,
                    hintText: controller.userResponse!.getData!.fullName??'Name',
                    bgColor: whiteBackground,
                    errormsg: "Please enter amount",
                    borderColor: borderColor,)
                ],
              ),
              SizedBox(height: 20.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mobile number", style: mediumText(16.sp,),),
                  SizedBox(height: 4.h,),
                  BackgroundTextfield(
                    controller: null,
                    readOnly: true,
                    isNumber: false,
                    isemail: false,
                    height: 48.h,
                    hintText:controller.userResponse!.getData!.phoneNumber?? "Mobile number",
                    bgColor: whiteBackground,
                    errormsg: "Please enter amount",
                    borderColor: borderColor,)
                ],
              ),
              SizedBox(height: 20.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email", style: mediumText(16.sp,),),
                  SizedBox(height: 4.h,),
                  BackgroundTextfield(
                    controller: null,
                    readOnly: true,
                    isNumber: false,
                    isemail: false,
                    height: 48.h,
                    hintText:controller.userResponse!.getData!.email?? "Email",
                    bgColor: whiteBackground,
                    errormsg: "Please enter amount",
                    borderColor: borderColor,)
                ],
              ),
              SizedBox(height: 20.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Birthday", style: mediumText(16.sp,),),
                  SizedBox(height: 4.h,),
                  BackgroundTextfield(
                    controller: null,
                    readOnly: true,
                    isNumber: false,
                    isemail: false,
                    height: 48.h,
                    hintText:controller.userResponse!.getData!.dob?? "dd/mm/yyyy",
                    bgColor: whiteBackground,
                    errormsg: "dd/mm/yyyy",
                    borderColor: borderColor,)
                ],
              ),
              SizedBox(height: 20.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender", style: mediumText(16.sp,),),
                  SizedBox(height: 4.h,),
                  controller.userResponse!.getData!.gender!=null?
                  Container(
                    width: 1.0.sw,
                    height: 52,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, color: Color(0xFFB4C2D4)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            controller.userResponse!.getData!.gender??'',
                            style: TextStyle(
                              color: Color(0xFF1B2441),
                              fontSize: 16,
                              fontFamily: 'Maven Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                      :
                  DropdownButtonFormField(
                    menuMaxHeight: 500,
                    validator: (value) {
                      if (value == null) {
                        return "Fill the field";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: borderColor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: borderColor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: OutlineInputBorder(

                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "select answer",
                        fillColor: Colors.white
                    ),
                    value: "Choose you gender",
                    onChanged: (newValue) {

                    },
                    items: ['Choose you gender', "Male", 'Feamle'].map<
                        DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
              SizedBox(height: 20.h,),
              CustomButton(
                  height: 48,
                  borderRadius: 4,
                  color: kPrimaryColorx,
                  textColor: Colors.white,
                  boder: false,
                  title: "Edit Profile",
                  onTap: () {
                    Navigator.pushNamed(context, EDIT_PROFILE_PAGE,arguments: {
                      'user':controller.userResponse!.getData!
                    });

                  }),
            ],
          );
        });
      },
    );
  }
}
