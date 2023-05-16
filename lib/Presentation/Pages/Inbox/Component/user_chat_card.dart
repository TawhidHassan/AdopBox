import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';

class UserChatCard extends StatelessWidget {
  const UserChatCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: 1.0.sw,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Image.asset("assets/images/user.png")),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Leslie Alexander",
                      style: boldText(16.sp, color: textColor),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Look like readable english many des....",
                      style: regularText(12.sp, color: textColor),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Icon(Icons.call))
            ],
          ),
          SizedBox(height: 16.h,),
          Divider(thickness: 1,color: unSelectColor,)
        ],
      ),
    );
  }
}
