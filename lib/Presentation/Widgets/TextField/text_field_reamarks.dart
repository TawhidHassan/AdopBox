import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SalesCreateRemarkTextfield extends StatelessWidget {
  final String lable;
  final String hintText;
  final bool readOnly;
  final bool isNumber;
  final num maxLine;
  TextEditingController? controller = TextEditingController();
  final bool isValueChnged;
  final Function(String)? tap;
  SalesCreateRemarkTextfield({required this.lable,this.controller, required this.hintText,required this.readOnly, required this.isNumber,  this.isValueChnged=false, this.tap, this.maxLine=6});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fillup';
          }else{
            return null;
          }

        },
        onChanged: isValueChnged?tap:null,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: maxLine.toInt(),
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          hintText: (hintText).tr(),
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
          contentPadding:
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color:Color(0xFFD9D9D9), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
