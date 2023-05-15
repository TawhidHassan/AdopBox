import 'package:AdopBox/Config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Colors/app_colors.dart';

class SettingButton extends StatelessWidget {
  final String?title;
  final String?image;
  final double?padding;
  const SettingButton({Key? key, this.title, this.image, this.padding=0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: padding!),
      width: 1.0.sw,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFEBF1F7),
                    child: SvgPicture.asset(image!,height: 18.h,),
                  ),
                  SizedBox(width:16.w),
                  Text(title!,style: mediumText(18.sp,color: textColor),),
                ],
              ),
              Icon(Icons.keyboard_arrow_right,color: unSelectColor,)
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 0.15.sw),
              child: Divider(color: dividerColor,thickness: 0.50,))
        ],
      ),
    );
  }
}
