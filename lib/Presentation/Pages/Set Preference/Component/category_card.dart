import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';

class PatCategoryCard extends StatelessWidget {
  const PatCategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 64.h,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: borderColor)
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(child: Image.asset("assets/icons/dog.png")),
          SizedBox(width: 12,),
          Expanded(child: Text("Dog",style: mediumText(14.sp,color: textColor),textAlign: TextAlign.start,)),
          Expanded(
              child: Checkbox(
                  value: false,
                  onChanged: (onChanged){})
          )
        ],
      ),
    );
  }
}
