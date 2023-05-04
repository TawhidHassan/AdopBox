import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/Presentation/Pages/Home/Component/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Button/custom_button.dart';


class RecentPostComponent extends StatelessWidget {
  const RecentPostComponent({Key? key}) : super(key: key);

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
              Text("Recent post",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
            ],
          ),
          SizedBox(height: 10.h,),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 13.0,
                crossAxisSpacing: 13.0,
                childAspectRatio:4/6,
              ),
              itemBuilder:(context,index){
                return Postcard();
              }
          ),
          SizedBox(height: 20.h,),
          CustomButton(
              height: 48.h,
              borderRadius: 4,
              color:kPrimaryColorx,
              textColor: Colors.white,
              title: "See all post",
              onTap: () {
                Navigator.pushNamed(context, ALL_POST_PAGE,);
              }),
          SizedBox(height: 13.h,),
        ],
      ),
    );
  }
}
