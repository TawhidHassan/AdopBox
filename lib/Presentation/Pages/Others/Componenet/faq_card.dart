import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';

class FAQCard extends StatelessWidget {
  final String? title;
  final String?discription;
  const FAQCard({Key? key, this.title, this.discription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title??"",style: mediumText(16.sp,color: textColor),),
          SizedBox(height: 8.h,),
          Text(discription??"",style: regularText(14.sp,color: textColor),),
        ],
      ),
    );
  }
}
