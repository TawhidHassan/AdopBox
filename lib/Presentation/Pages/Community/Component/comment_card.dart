import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';

class Commentcard extends StatelessWidget {
  const Commentcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage("assets/images/user.png"),
                        fit: BoxFit.contain
                    )
                ),
              ),
              SizedBox(width: 8.w,),
              Text("Savannah Nguyen",style: semiBoldText(14.sp,color: textColor),),
            ],
          ),
          SizedBox(height: 8.h,),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: unSelectColor,
                borderRadius: borderRadius
            ),
            child: Text("Lorem ipsum dolor sit amet consectetur. In lorem enim varius diam",style: regularText(16.sp,color: textColor),),
          ),
          SizedBox(height: 8.h,),
          Text("Reply",style: semiBoldText(14.sp,color: textColor),),
        ],
      ),
    );
  }
}
