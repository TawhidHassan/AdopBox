import 'package:Shomridhi/Config/text_style.dart';
import 'package:Shomridhi/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAleartDialouge{
  showAlertDialog(
      {BuildContext? context,
      String? title,
      String? discription,
      String? image,
      String? actionbutton,
      String? navigationName,
      String? buttonText}) {

    // set up the button
    Widget okButton = TextButton(
      child: Text(buttonText??""),
      onPressed: () {
        Navigator.pop(context!);
      },
    );
    Widget actionButton = TextButton(
      child: Text(actionbutton??""),
      onPressed: () {
        Navigator.pushNamed(context!,navigationName!);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text(title??"",style: boldText(16.sp,color: kPrimaryColorx),),
      content: Container(
        height: 200.h,
        child: Column(
          children: [
            image!=null?Image.asset(image):SizedBox(),
            SizedBox(height: 12.h,),
            Text(discription??""),
          ],
        ),
      ),
      actions: [
        okButton,
        actionbutton!=null? actionButton:SizedBox(),
      ],
    );

    // show the dialog
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

