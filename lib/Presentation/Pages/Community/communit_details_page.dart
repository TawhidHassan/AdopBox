import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Config/text_style.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/TextField/bg_textfield.dart';
import 'Component/comment_card.dart';
import 'Component/community_card.dart';

class CommunityDetailsPage extends StatelessWidget {
  const CommunityDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post details"),
      ),
      body: SizedBox(
        height: 1.0.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      ],
                    ),
                  ),
                  SizedBox(height: 22.h,),
                  Divider(thickness: 6,color: unSelectColor,),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Post comments (3)",style: semiBoldText(14.sp,color: textColor),),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Commentcard(),
                      Commentcard(),
                      Commentcard(),
                    ],
                  ),
                )

            ),
            SizedBox(height: 80.h,),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80.h,
        width: 1.0.sw,
        color: whiteBackground,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: BackgroundTextfield(
                controller: null,
                readOnly: false,
                isNumber: false,
                isemail: false,
                height: 48.h,
                hintText: "Type comment...",
                bgColor: whiteBackground,
                errormsg: "Please enter text",
                borderColor: borderColor,),
            ),
            SizedBox(width: 12.w,),
            Expanded(
                flex: 1,
                child: SvgPicture.asset("assets/icons/sent.svg")
            )
          ],
        ),
      ),
    );
  }
}
