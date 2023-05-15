import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';

class PetInfoCard extends StatelessWidget {
  final String? title;
  final String? image;
  final String? value;
  const PetInfoCard({Key? key, this.title, this.image, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFEBF1F7),
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(image!,),
          SizedBox(height: 13,),
          Text(title!,style: regularText(12.sp,color: textColor),),
          SizedBox(height: 4,),
          Text(value!,style: semiBoldText(14.sp,color: kPrimaryColorx),),
        ],
      ),
    );
  }
}
