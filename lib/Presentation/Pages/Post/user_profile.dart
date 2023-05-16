import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Config/text_style.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/TextField/bg_textfield.dart';
import 'Component/related_post.dart';

class Userprofile extends StatelessWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body:ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            height: 68,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0XFF332D58),
                      child: Image.asset("assets/images/user.png"),
                    ),
                    SizedBox(width: 8,),
                    Text("Jit Banik",style: semiBoldText(16.sp,color: textColor),)
                  ],
                ),
                Row(
                  children: [
                    CustomButton(
                        height: 32.h,
                        borderRadius: 4,
                        width: 73,
                        boder: true,
                        color:kPrimaryColorx,
                        textColor: Colors.white,
                        title: "Chat",
                        onTap: () {
                          // Navigator.pushNamed(context, Connect,);
                        }),
                    SizedBox(width: 12,),
                    CustomButton(
                        height: 32.h,
                        borderRadius: 4,
                        width: 73,
                        color:kPrimaryColorx,
                        textColor: Colors.white,
                        title: "Call",
                        onTap: () {
                          // Navigator.pushNamed(context, Connect,);
                        }),
                  ],
                )
              ],
            ),
          ),
          Divider(thickness: 1,color: unSelectColor,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("1.6k posts",style: mediumText(16.sp,color: textColor),),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        categorSheet(context);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/more-2.svg"),
                          SizedBox(width: 10.w,),
                          Text('Category', style: mediumText(
                              16.sp, color: appBarTitleTextColor),)
                        ],
                      ),
                    ),
                    SizedBox(width: 22.w,),
                    InkWell(
                      onTap: (){
                        filterSheet(context);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/filter.svg"),
                          SizedBox(width: 10.w,),
                          Text('Filter', style: mediumText(
                              16.sp, color: appBarTitleTextColor),)
                        ],
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
          SizedBox(height: 12,),
          Divider(thickness: 1,color: unSelectColor,),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RelatedPost(),
          )
        ],
      )
    );
  }

  void categorSheet(BuildContext context){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      // set this to true
      shape: const RoundedRectangleBorder( // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.70,
          initialChildSize: 0.70,
          builder: (_, controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60.h,
                  width: 40.w,

                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture
                          .asset("assets/icons/close.svg",)),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)
                      )
                  ),
                  height: 0.62.sh,
                  width: 1.0.sw,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/border.svg"),
                                  SizedBox(width: 12.w,),
                                  Text("Categories",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
                                ],
                              ),
                            ),
                            Divider(color: unSelectColor,thickness: 2,)
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 13,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 14,
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
                        ),
                      ),

                      Expanded(
                          flex: 3,
                          child:Column(
                            children: [
                              Divider(color: unSelectColor,thickness: 2,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 6),
                                child: CustomButton(
                                    height: 48.h,
                                    borderRadius: 4,
                                    color:kPrimaryColorx,
                                    textColor: Colors.white,
                                    title: "Apply",
                                    onTap: () {

                                    }),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
  void filterSheet(BuildContext context){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      // set this to true
      shape: const RoundedRectangleBorder( // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.70,
          initialChildSize: 0.70,
          builder: (_, controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60.h,
                  width: 40.w,

                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture
                          .asset("assets/icons/close.svg",)),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)
                      )
                  ),
                  height: 0.62.sh,
                  width: 1.0.sw,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/border.svg"),
                                  SizedBox(width: 12.w,),
                                  Text("Filter",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
                                ],
                              ),
                            ),
                            Divider(color: unSelectColor,thickness: 2,)
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 13,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Post Type",style: semiBoldText(16.sp,color: textColor),),
                                  SizedBox(height: 12.h,),
                                  SizedBox(
                                    width: 1.0.sw,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: borderColor),
                                                borderRadius: borderRadius
                                            ),
                                            child: Row(
                                              children: [
                                                Radio(value: true, groupValue: true, onChanged: (onChanged){}),
                                                Text("All",style: mediumText(16.sp,color: textColor),)
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 13.w,),
                                        Expanded(
                                          child: Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: borderColor),
                                                borderRadius: borderRadius
                                            ),
                                            child: Row(
                                              children: [
                                                Radio(value: true, groupValue: true, onChanged: (onChanged){}),
                                                Text("Free",style: mediumText(16.sp,color: textColor),)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.0.sw,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 13.h),
                                            height: 48,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: borderColor),
                                                borderRadius: borderRadius
                                            ),
                                            child: Row(
                                              children: [
                                                Radio(value: true, groupValue: true, onChanged: (onChanged){}),
                                                Text("Paid",style: mediumText(16.sp,color: textColor),)
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 13.w,),
                                        Expanded(
                                          child: SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 16.h,),
                                  Text("Price range",style: semiBoldText(16.sp,color: textColor),),
                                  SizedBox(height: 12.h,),
                                  SizedBox(
                                    width: 1.0.sw,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: BackgroundTextfield(
                                            controller: null,
                                            readOnly: false,
                                            isNumber: false,
                                            isemail: false,
                                            hintText: "Minimum",
                                            bgColor: whiteBackground,
                                            errormsg: "Please enter amount",
                                            borderColor: borderColor,),
                                        ),
                                        SizedBox(width: 13.w,),
                                        Expanded(
                                          child: BackgroundTextfield(
                                            controller: null,
                                            readOnly: false,
                                            isNumber: false,
                                            isemail: false,
                                            hintText: "Maximum",
                                            bgColor: whiteBackground,
                                            errormsg: "Please enter amount",
                                            borderColor: borderColor,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Divider(color: unSelectColor,thickness: 2,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 6),
                              child: CustomButton(
                                  height: 48.h,
                                  borderRadius: 4,
                                  color:kPrimaryColorx,
                                  textColor: Colors.white,
                                  title: "Apply",
                                  onTap: () {

                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
