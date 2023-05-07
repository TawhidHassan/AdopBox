import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final String? title;
  const NotificationCard({Key? key, this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: 1.0.sw,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: kPrimaryColorx.shade100,
                    child: SvgPicture.asset("assets/icons/notification.svg",height: 18.h,),
                  ),
                  SizedBox(width:16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title!,style: mediumText(14.sp,color: textColor),),
                      Text("Just now",style: regularText(12.sp,color: Color(0xFF555F71)),),
                    ],
                  )
                ],
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 45.w),
              child: Divider(color: dividerColor,thickness: 1,))
        ],
      ),
    );
  }
}
