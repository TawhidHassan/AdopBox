import 'package:AdopBox/Data/Model/User/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Config/text_style.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../../GetX Controller/AuthController/AuthController.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/Loading/loading_widget.dart';
import '../../Widgets/TextField/bg_textfield.dart';

class EditProfile extends StatelessWidget {
  final User? user;
  const EditProfile({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),

      body: GetBuilder<AuthController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.circuler.value?LoadingWidget():
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  SizedBox(height: 20.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your name", style: mediumText(16.sp,),),
                      SizedBox(height: 4.h,),
                      BackgroundTextfield(
                        controller: null,
                        readOnly: false,
                        isNumber: false,
                        isemail: false,
                        height: 48.h,
                        hintText: controller.userResponse!.getData!.fullName??'Name',
                        bgColor: whiteBackground,
                        errormsg: "Please enter amount",
                        isValueChnged: true,
                        tap: (text){
                          controller.name.value=text;
                        },
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
                        readOnly: false,
                        isNumber: true,
                        isemail: false,
                        height: 48.h,
                        hintText:controller.userResponse!.getData!.phoneNumber?? "Mobile number",
                        bgColor: whiteBackground,
                        isValueChnged: true,
                        tap: (text){
                          controller.number.value=text;
                        },
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
                        readOnly: false,
                        isNumber: false,
                        isValueChnged: true,
                        tap: (text){
                          controller.bod.value=text;
                        },
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
                        value: controller.userResponse!.getData!.gender??"Choose you gender",
                        onChanged: (newValue) {
                            controller.genders.value=newValue!;
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
                  controller.updateCirculer.value?LoadingWidget():
                  CustomButton(
                      height: 48,
                      borderRadius: 4,
                      color: kPrimaryColorx,
                      textColor: Colors.white,
                      boder: false,
                      title: "Edit Profile",
                      onTap: () {
                        controller.upDatProfile(controller.name.value,controller.number.value,controller.bod.value,controller.genders.value,context);

                      }),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
