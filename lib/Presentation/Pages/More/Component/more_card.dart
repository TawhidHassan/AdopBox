import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';

class MoreCard extends StatelessWidget {
  final String? title;
  final String? image;
  const MoreCard({Key? key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: whiteBackground,
          border: Border.all(color: borderColor),
          borderRadius: borderRadius,
          boxShadow: [
              BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 5), // changes position of shadow
            ),
        ],
      ),
      height: 80.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image??""),
          SizedBox(height: 6.h,),
          Text(title??"",style: mediumText(12.sp,color: textColor),)
        ],
      ),
    );
  }
}
