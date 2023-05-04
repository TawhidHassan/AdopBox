import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Constants/Strings/app_content_strings.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Button/custom_button.dart';
import 'Component/category_card.dart';

class SetPreferencePage extends StatelessWidget {
  const SetPreferencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteBackground,
        // automaticallyImplyLeading: true,
        // leading: BackButton(color: appBarTitleTextColor,),
        title: Text("Select your preference",style: semiBoldText(18.sp,color: appBarTitleTextColor),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
                child: Text(preference_top_title,style: regularText(12.sp,color: textColor),)),
            SizedBox(height: 12.h,),
            Expanded(
              flex: 1,
              child: Container(

                width: 1.0.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:1,
                      child: Checkbox(
                          value: false,
                          onChanged: (value){}
                      ),
                    ),
                    SizedBox(width: 12.w,),
                    Expanded(
                        flex:16,
                        child: Text("Select all category",style: mediumText(14.sp,color: textColor),))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 11.0,
                    childAspectRatio:8/3,
                  ),
                  itemBuilder:(context,index){
                    return PatCategoryCard();
               }
              ),
            )
          ],
        ),
      ),
      bottomSheet:Container(

        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1.0.h, color:borderColor),
          ),
        ),
        padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 8),
        height: 80.h,
        child: CustomButton(
            height: 48.h,
            borderRadius: 4,
            color:kPrimaryColorx,
            textColor: Colors.white,
            title: "Apply",
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, MAIN_PAGE,(route) => false,);
            }),

      )
    );
  }
}
