import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Button/custom_button.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: AssetImage("assets/images/user.png"),
                            fit: BoxFit.contain
                        )
                    ),
                  ),
                  SizedBox(width: 12.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Albert Flores",style: semiBoldText(18.sp,color: textColor),),
                      SizedBox(height: 2.w,),
                      Text("12/02/22",style: regularText(12.sp,color: Color(0XFF555F71)),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 8.h,),
              Text("Lorem ipsum dolor sit amet consectetur. In lorem enim varius diam volutpat diam non at aliquam. Imperdiet est enim fringilla non. Vel tortor nibh auctor arcu pellentesque sapien. Egestas ultrices lectus aliquet purus.",style: regularText(14.sp,color:Color(0XFF555F71) ),),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      height: 36.h,
                      width: 120.w,
                      borderRadius: 4,
                      color:kPrimaryColorx,
                      textColor: Colors.white,
                      title: "See details",
                      onTap: () {
                        Navigator.pushNamed(context, COMUNITY_POST_DETAILS_PAGE);
                      }),
                  Text("Category :Dog",style: regularText(14.sp,color: textColor),)
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 22.h,),
        Divider(thickness: 6,color: unSelectColor,)
      ],
    );
  }
}
