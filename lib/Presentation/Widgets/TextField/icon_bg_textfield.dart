 import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconBackgroundTextfield extends StatelessWidget {
  final String hintText;
  final String icons;
  final bool readOnly;
  Color? bgColor=Color(0xFFE7EBF6);
  Color? borderColor=Color(0xFFE7EBF6);
  final bool isNumber;
  final bool isValueChnged;
  final bool isemail;
  final Function(String)? tap;
  TextEditingController? controller;
  IconBackgroundTextfield({ this.controller,
  required this.hintText,required this.readOnly,
  required this.isNumber,this.bgColor,this.borderColor, this.tap,  this.isValueChnged=false,  this.isemail=false,  required this.icons});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 48.h,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            if(isNumber){
              return "Enter a valid mobile number";
            }else if(isemail){
              return "Enter a valid email address";
            }else{
              return "Fill the field";
            }
          }else{
            String pattern =
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?)*$";
            RegExp regex = RegExp(pattern);

            if(isNumber){
              return value.length < 11 ?'invalid number':null;
            }
            else if(isemail){
             return !regex.hasMatch(value)?'invalid email':null;
            } else{
              return null;
            }

          }

        },
        keyboardType: isNumber?TextInputType.number:TextInputType.text,
        inputFormatters:isNumber? [
          LengthLimitingTextInputFormatter(11),
        ]:[],
        readOnly: readOnly,
        controller: controller,
        onChanged: isValueChnged?tap:null,

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0,vertical: 13),
            child: SvgPicture.asset(icons,color: Colors.grey,), // icon is 48px widget.
          ),
          fillColor: bgColor,
          filled: true,
          contentPadding:
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color:textFieldBorder, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color:textFieldBorder, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
      ),
    );
  }
}
