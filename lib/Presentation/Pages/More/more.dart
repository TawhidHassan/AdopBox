import 'package:AdopBox/Config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Constants/Colors/app_colors.dart';
import 'Component/more_card.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        height: 1.0.sh,
        width: 1.0.sw,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex:2,
                        child: Container(
                          height: 64.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage("assets/images/user.png"),
                              fit: BoxFit.contain
                            )
                          ),
                        )),
                    SizedBox(width: 16.w,),
                    Expanded(
                      flex:11,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Guest user",style: semiBoldText(20.sp,color: textColor),),
                          SizedBox(height: 6.h,),
                          Text("Log in or sign up to ",style: regularText(14.sp,color: textColor),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Divider(
                  color: dividerColor,thickness: 2,)
            ),
            Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Container(
                      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      width:1.0.sw,
                      child: Row(
                        children: [
                          Expanded(
                              child:MoreCard(image:"assets/icons/user.svg",title: "My account",)
                          ),
                          SizedBox(width: 11.w,),
                          Expanded(
                              child:MoreCard(image:"assets/icons/user.svg",title: "My account",)
                          ),
                          SizedBox(width: 11.w,),
                          Expanded(
                              child:MoreCard(image:"assets/icons/user.svg",title: "My account",)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      width:1.0.sw,
                      child: Row(
                        children: [
                          Expanded(
                              child:MoreCard(image:"assets/icons/user.svg",title: "My account",)
                          ),
                          SizedBox(width: 11.w,),
                          Expanded(
                              child:MoreCard(image:"assets/icons/user.svg",title: "My account",)
                          ),
                          SizedBox(width: 11.w,),
                          Expanded(
                              child:MoreCard(image:"assets/icons/user.svg",title: "My account",)
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
