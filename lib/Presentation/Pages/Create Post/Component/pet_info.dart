import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:AdopBox/GetX%20Controller/PostCreate/PostCreateController.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../Widgets/Button/custom_button.dart';
import '../../../Widgets/TextField/bg_textfield.dart';

class Petinfo extends StatelessWidget {
  final PostCreateController? postCreateController;
  const Petinfo({Key? key, this.postCreateController}) : super(key: key);

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
                                  width: 4.0, color: kPrimaryColorx),
                            ),
                          ),
                          child: Text("Pet info",
                            style: mediumText(12.sp, color: kPrimaryColorx),
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
                                  width: 4.0, color: unSelectColor),
                            ),
                          ),
                          child: Text("Other info",
                            style: mediumText(12.sp, color: unSelectColor),textAlign: TextAlign.center,),
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
                        Text("Is your pet tame or stray?", style: mediumText(16.sp,),),
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
                                      Text("Tame",style: mediumText(16.sp,color: textColor),)
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
                                      Text("Stray",style: mediumText(16.sp,color: textColor),)
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
                        Text("Is your pet vaccinated?", style: mediumText(16.sp,),),
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
                                      Text("Yes",style: mediumText(16.sp,color: textColor),)
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
                                      Text("No",style: mediumText(16.sp,color: textColor),)
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
                        Text("Pet gender?", style: mediumText(16.sp,),),
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
                                      Text("Male",style: mediumText(16.sp,color: textColor),)
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
                                      Text("Female",style: mediumText(16.sp,color: textColor),)
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
                        Text("Does your pet have any diseases?", style: mediumText(16.sp,),),
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
                                      Text("Yes",style: mediumText(16.sp,color: textColor),)
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
                                      Text("No",style: mediumText(16.sp,color: textColor),)
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
                        Text("Select category", style: mediumText(16.sp,),),
                        SizedBox(height: 8.h,),
                        InkWell(
                          onTap: (){
                            categorSheet(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(color: borderColor)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Select Category",style: mediumText(16.sp,color: textColor),),
                                Icon(Icons.keyboard_arrow_right,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pet age (Optional)", style: mediumText(16.sp,),),
                        SizedBox(height: 8.h,),
                        InkWell(
                          onTap: (){
                            ageSheet(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(color: borderColor)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Select pet age",style: mediumText(16.sp,color: textColor),),
                                Icon(Icons.keyboard_arrow_right,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pet weight (Optional)", style: mediumText(16.sp,),),
                        SizedBox(height: 8.h,),
                        InkWell(
                          onTap: (){
                            weightSheet(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(color: borderColor)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Select pet weight",style: mediumText(16.sp,color: textColor),),
                                Icon(Icons.keyboard_arrow_right,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h,),
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
                              postCreateController!.controller.jumpToPage(2);
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


  void ageSheet(BuildContext context){
    int _currentValue = 2;
    int _currentValue2 = 2;
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
                                  Text("Age",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
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
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: StatefulBuilder(
                            builder: (context,setState){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:[
                                  NumberPicker(
                                    decoration:BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 2.0, color: dividerColor),
                                        bottom: BorderSide(width: 2.0, color: dividerColor),
                                      ),
                                    ),
                                    value: _currentValue,
                                    minValue: 0,
                                    maxValue: 100,
                                    selectedTextStyle: TextStyle(
                                        color: textColor,
                                        fontSize: 32.sp
                                    ),
                                    haptics: true,
                                    onChanged: (value) => setState(() => _currentValue = value),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: textColor
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  NumberPicker(
                                    decoration:BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 2.0, color: dividerColor),
                                        bottom: BorderSide(width: 2.0, color: dividerColor),
                                      ),
                                    ),
                                    selectedTextStyle: TextStyle(
                                      color: textColor,
                                        fontSize: 32.sp
                                    ),
                                    value: _currentValue2,
                                    minValue: 0,
                                    maxValue: 100,
                                    haptics: true,
                                    onChanged: (value) => setState(() => _currentValue2 = value),
                                  ),
                                  SizedBox(width: 24,),
                                  Text("Year",style: semiBoldText(14.sp,color: textColor),)
                                ],
                              );
                            },
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
  void weightSheet(BuildContext context){
    int _currentValue = 2;
    int _currentValue2 = 2;
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
                                  Text("Weight",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
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
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: StatefulBuilder(
                            builder: (context,setState){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:[
                                  NumberPicker(
                                    decoration:BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 2.0, color: dividerColor),
                                        bottom: BorderSide(width: 2.0, color: dividerColor),
                                      ),
                                    ),
                                    value: _currentValue,
                                    minValue: 0,
                                    maxValue: 100,
                                    selectedTextStyle: TextStyle(
                                        color: textColor,
                                        fontSize: 32.sp
                                    ),
                                    haptics: true,
                                    onChanged: (value) => setState(() => _currentValue = value),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: textColor
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  NumberPicker(
                                    decoration:BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 2.0, color: dividerColor),
                                        bottom: BorderSide(width: 2.0, color: dividerColor),
                                      ),
                                    ),
                                    selectedTextStyle: TextStyle(
                                      color: textColor,
                                        fontSize: 32.sp
                                    ),
                                    value: _currentValue2,
                                    minValue: 0,
                                    maxValue: 100,
                                    haptics: true,
                                    onChanged: (value) => setState(() => _currentValue2 = value),
                                  ),
                                  SizedBox(width: 24,),
                                  Text("KG",style: semiBoldText(14.sp,color: textColor),)
                                ],
                              );
                            },
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
}
