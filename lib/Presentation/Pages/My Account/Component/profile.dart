import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../Widgets/TextField/bg_textfield.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
              hintText: "Name",
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
              readOnly: false,
              isNumber: false,
              isemail: false,
              height: 48.h,
              hintText: "Mobile number",
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
              readOnly: false,
              isNumber: false,
              isemail: false,
              height: 48.h,
              hintText: "Email",
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
              readOnly: false,
              isNumber: false,
              isemail: false,
              height: 48.h,
              hintText: "dd/mm/yyyy",
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
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color:borderColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color:borderColor, width: 1.0),
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
              value:"Choose you gender",
              onChanged: (newValue) {

              },
              items: ['Choose you gender',"Male",'Feamle'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
        SizedBox(height: 20.h,),
      ],
    );
  }
}
