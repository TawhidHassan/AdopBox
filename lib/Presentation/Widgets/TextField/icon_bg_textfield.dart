 import 'package:easy_localization/easy_localization.dart';
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
  IconBackgroundTextfield({required this.controller,
  required this.hintText,required this.readOnly,
  required this.isNumber,this.bgColor,this.borderColor, this.tap,  this.isValueChnged=false,  this.isemail=false,  required this.icons});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 48.h,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            if(isNumber){
              return tr("Enter a valid mobile number");
            }else if(isemail){
              return tr("Enter a valid email address");
            }else{
              return tr("Fill the field");
            }
          }else{
            String pattern =
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?)*$";
            RegExp regex = RegExp(pattern);

            if(isNumber){
              return value.length < 11 ?tr('invalid number'):null;
            }
            else if(isemail){
             return !regex.hasMatch(value)?tr('invalid email'):null;
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
          hintText: tr(hintText),
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon:  Padding(
            padding: EdgeInsets.all(10.0),
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
            BorderSide(color:borderColor!, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color:borderColor!, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
      ),
    );
  }
}
