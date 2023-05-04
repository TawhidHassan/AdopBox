import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CategoryComponent extends StatelessWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(

        children: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/border.svg"),
              SizedBox(width: 12.w,),
              Text("Categories",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
            ],
          ),
          SizedBox(height: 10.h,),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 11.0,
                crossAxisSpacing: 0.0,
                childAspectRatio:4/5,
              ),
              itemBuilder:(context,index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:74.h,
                      width: 74.w,
                      padding:EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        // color: kPrimaryColorx,
                        borderRadius: borderRadius,
                        border: Border.all(color: borderColor)
                      ),
                      child: Image.asset("assets/icons/dogy.png"),
                    ),
                    SizedBox(height: 8.h,),
                    Text("Dog",style: mediumText(14.sp,color: appBarTitleTextColor),)
                  ],
                );
              }
          ),
        ],
      ),
    );
  }
}
