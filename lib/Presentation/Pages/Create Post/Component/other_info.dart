import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:AdopBox/GetX%20Controller/PostCreate/PostCreateController.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Widgets/Button/custom_button.dart';
import '../../../Widgets/TextField/bg_textfield.dart';
import '../../../Widgets/TextField/text_field_reamarks.dart';

class OtherInfo extends StatelessWidget {
  final PostCreateController? postCreateController;
  const OtherInfo({Key? key, this.postCreateController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0.sh,
      width: 1.0.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          postCreateController!.controller.jumpToPage(0);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 4.0, color: unSelectColor),
                            ),
                          ),
                          child: Text("Personal details",
                            style: mediumText(12.sp, color: unSelectColor),),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          postCreateController!.controller.jumpToPage(1);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 4.0, color: unSelectColor),
                            ),
                          ),
                          child: Text("Pet info",
                            style: mediumText(12.sp, color: unSelectColor),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          postCreateController!.controller.jumpToPage(2);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 4.0, color: kPrimaryColorx),
                            ),
                          ),
                          child: Text("Other info",
                            style: mediumText(12.sp, color: kPrimaryColorx),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20,),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Post title", style: mediumText(16.sp,),),
                        SizedBox(height: 4.h,),
                        BackgroundTextfield(
                          controller: null,
                          readOnly: false,
                          isNumber: false,
                          isemail: false,
                          height: 48.h,
                          hintText: "Type post title",
                          bgColor: whiteBackground,
                          errormsg: "Please enter amount",
                          borderColor: borderColor,)
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Post type?", style: mediumText(16.sp,),),
                        SizedBox(height: 4.h,),
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
                                      Text("Adoption",style: mediumText(16.sp,color: textColor),)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 13.w,),
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
                                      Radio(value: true, groupValue: false, onChanged: (onChanged){}),
                                      Text("Paid",style: mediumText(16.sp,color: textColor),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add photo", style: mediumText(16.sp,),),
                        SizedBox(height: 8.h,),
                        Text("(Upload min 2 and max 5 photos)", style: regularText(14.sp,color: textColor),),
                        SizedBox(height: 16.h,),
                        CustomButton(
                            height: 36.h,
                            borderRadius: 4,
                            width: 138.w,
                            color: kPrimaryColorx,
                            textColor: Colors.white,
                            boder: true,
                            title: "Upload photo",
                            onTap: () {

                            }),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description (Optional)", style: mediumText(16.sp,),),
                        SizedBox(height: 8.h,),
                        SalesCreateRemarkTextfield(
                          readOnly: false,
                          isNumber: false,
                          hintText: "Type description`",
                          lable: "",
                          controller: null,
                          maxLine: 5,
                        )
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Terms & Conditions (Options)", style: mediumText(16.sp,),),
                        SizedBox(height: 4.h,),
                        SizedBox(
                          width: 1.0.sw,
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                  child: Text("1.",style: mediumText(16.sp,color: textColor),)),
                              Expanded(
                                flex:10,
                                child: SizedBox(
                                  height: 48.h,
                                  child: BackgroundTextfield(
                                    controller: null,
                                    readOnly: false,
                                    isNumber: false,
                                    isemail: false,
                                    height: 48.h,
                                    hintText: "Type post title",
                                    bgColor: whiteBackground,
                                    errormsg: "Please enter amount",
                                    borderColor: borderColor,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        CustomButton(
                            height: 36.h,
                            borderRadius: 4,
                            width: 138.w,
                            color: kPrimaryColorx,
                            textColor: Colors.white,
                            boder: true,
                            title: "Add more",
                            onTap: () {

                            }),
                      ],
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Divider(color: unSelectColor, thickness: 2,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            height: 48.h,
                            borderRadius: 4,
                            color: kPrimaryColorx,
                            textColor: Colors.white,
                            boder: true,
                            title: "Save draft",
                            onTap: () {

                            }),
                      ),
                      SizedBox(width: 11.w,),
                      Expanded(
                        child: CustomButton(
                            height: 48.h,
                            borderRadius: 4,
                            color: kPrimaryColorx,
                            textColor: Colors.white,
                            title: "Next",
                            onTap: () {
                              print(postCreateController!.controller.page);
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
