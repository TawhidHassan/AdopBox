import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Config/text_style.dart';

class ChatCard extends StatelessWidget {
  final bool? me;
  const ChatCard({Key? key, this.me=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return me!?
    Container(
        padding: EdgeInsets.all(8),
        width:1.0.sw ,
        child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(bottom: 2,left: 50),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: kPrimaryColorx.shade400,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8) ,bottomRight: Radius.circular(0),bottomLeft:Radius.circular(8)  )
              ),
              child: Text("widget.text!ddddddddddddddddddddddddddddddddddddddddddddddddddcx",style: mediumText(12.sp,color: Color(0xFFFFFFFF)),),
            )
        )
    ):
    Container(
      padding: EdgeInsets.all(8),
      width:1.0.sw ,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0XFF332D58),
            child: Image.asset("assets/images/user.png"),
          ),
          SizedBox(width: 8.w,),
          Flexible(
              child: Container(
                margin: EdgeInsets.only(bottom: 2),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: kPrimaryColorx,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8) ,bottomRight: Radius.circular(8) )
                ),
                child: Text("widget.text!",style: mediumText(12.sp,color: Color(0xFFFFFFFF)),),
              )
          )
        ],
      ),
    );
  }
}
