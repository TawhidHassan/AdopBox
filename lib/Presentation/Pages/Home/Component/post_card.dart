import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Strings/app_strings.dart';


class Postcard extends StatelessWidget {
  const Postcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, POST_DETAILS);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: borderColor)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        topLeft: Radius.circular(4),
                      ),
                    image: DecorationImage(
                        image: AssetImage("assets/images/dog.png"),
                      fit: BoxFit.cover
                    )
                  ),
                )
            ),
            Expanded(
              flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Project title goes here",style: regularText(14.sp,color: textColor),),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/taka.svg"),
                            SizedBox(width: 8.w,),
                            Text("Free",style: boldText(16.sp,color: kPrimaryColorx),)
                          ],
                        )
                      ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
