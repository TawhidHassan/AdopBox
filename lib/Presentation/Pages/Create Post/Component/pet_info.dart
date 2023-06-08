import 'package:AdopBox/Bloc/CategoryBreedOrigin/category_breed_origin_cubit.dart';
import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/Data/Model/Category/Category.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:AdopBox/GetX%20Controller/PostCreate/PostCreateController.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../Widgets/Button/custom_button.dart';
import '../../../Widgets/TextField/bg_textfield.dart';

class Petinfo extends StatelessWidget {
  final PostCreateController? postCreateController;
  const Petinfo({Key? key, this.postCreateController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBreedOriginCubit, CategoryBreedOriginState>(
      listener: (context, state) {
        if(state is CategoryBreedOriginGet){
          final data=(state as CategoryBreedOriginGet).breedOriginCategoryResponse;
          Logger().w(data);
          postCreateController!.categoryList!.value=data!.getData!.getCategory!;
          postCreateController!.breedList!.value=data.getData!.getBreed!;
          postCreateController!.originList!.value=data.getData!.getOrigin!;

        }
      },
    child: SizedBox(
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
                            style: mediumText(11.sp, color: unSelectColor),),
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
                            style: mediumText(11.sp, color: kPrimaryColorx),
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
                            style: mediumText(11.sp, color: unSelectColor),textAlign: TextAlign.center,),
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
                                child: InkWell(
                                  onTap:(){
                                    postCreateController!.patTypeUpdate("tame");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 13.h),
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: borderRadius
                                    ),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: postCreateController!.darftPostModel!.petType=="tame",
                                            onChanged: (onChanged){
                                              postCreateController!.patTypeUpdate("tame");
                                            }),
                                        Text("Tame",style: mediumText(16.sp,color: textColor),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 13.w,),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    postCreateController!.patTypeUpdate("stray");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 13.h),
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: borderRadius
                                    ),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: postCreateController!.darftPostModel!.petType=="stray",
                                            onChanged: (onChanged){
                                              postCreateController!.patTypeUpdate("tame");

                                            }),
                                        Text("Stray",style: mediumText(16.sp,color: textColor),)
                                      ],
                                    ),
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
                                child: InkWell(
                                  onTap:(){
                                    postCreateController!.patVacinatedUpdate(true);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 13.h),
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: borderRadius
                                    ),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: postCreateController!.darftPostModel!.vaccinated==true,
                                            onChanged: (onChanged){
                                              postCreateController!.patVacinatedUpdate(true);
                                            }
                                        ),
                                        Text("Yes",style: mediumText(16.sp,color: textColor),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 13.w,),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    postCreateController!.patVacinatedUpdate(false);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 13.h),
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: borderRadius
                                    ),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: postCreateController!.darftPostModel!.vaccinated==false,
                                            onChanged: (onChanged){
                                              postCreateController!.patVacinatedUpdate(false);
                                            }
                                        ),
                                        Text("No",style: mediumText(16.sp,color: textColor),)
                                      ],
                                    ),
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
                                child: InkWell(
                                  onTap:(){
                                    postCreateController!.patGenderUpdate(1);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 13.h),
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: borderRadius
                                    ),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: postCreateController!.darftPostModel!.gender==1,
                                            onChanged: (onChanged){
                                              postCreateController!.patGenderUpdate(1);
                                             }
                                            ),
                                        Text("Male",style: mediumText(16.sp,color: textColor),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 13.w,),
                              Expanded(
                                child: InkWell(
                                  onTap:(){
                                    postCreateController!.patGenderUpdate(2);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 13.h),
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: borderRadius
                                    ),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: postCreateController!.darftPostModel!.gender==2,
                                            onChanged: (onChanged){
                                              postCreateController!.patGenderUpdate(2);
                                            }
                                        ),
                                        Text("Female",style: mediumText(16.sp,color: textColor),)
                                      ],
                                    ),
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
                                child: InkWell(
                                  onTap:(){
                                    postCreateController!.patDisesesUpdate(true);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 13.h),
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: borderRadius
                                    ),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: postCreateController!.darftPostModel!.dieseas==true,
                                            onChanged: (onChanged){
                                              postCreateController!.patDisesesUpdate(true);
                                            }
                                        ),
                                        Text("Yes",style: mediumText(16.sp,color: textColor),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 13.w,),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    postCreateController!.patDisesesUpdate(false);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 13.h),
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: borderRadius
                                    ),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: postCreateController!.darftPostModel!.dieseas==false,
                                            onChanged: (onChanged){
                                              postCreateController!.patDisesesUpdate(false);
                                            }
                                        ),
                                        Text("No",style: mediumText(16.sp,color: textColor),)
                                      ],
                                    ),
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
                            categorSheet(context,postCreateController!.categoryList!.value);
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
                                Text(postCreateController!.selectCategory.value==""?"Select Category":postCreateController!.selectCategory.value,style: mediumText(16.sp,color: textColor),),
                                Icon(Icons.keyboard_arrow_right,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    postCreateController!.selectCategory.value==""?SizedBox(): SizedBox(height: 20.h,),
                    postCreateController!.selectCategory.value!=""?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Origin", style: mediumText(16.sp,),),
                        SizedBox(height: 8.h,),
                        InkWell(
                          onTap: (){
                            originSheet(context);
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
                                Text(postCreateController!.selectOrigin.value==""?"Select Origin":postCreateController!.selectOrigin.value,style: mediumText(16.sp,color: textColor),),
                                Icon(Icons.keyboard_arrow_right,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ):SizedBox(),
                    postCreateController!.selectOrigin.value==""?SizedBox(): SizedBox(height: 20.h,),
                    postCreateController!.selectOrigin.value!=""?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Breed", style: mediumText(16.sp,),),
                        SizedBox(height: 8.h,),
                        InkWell(
                          onTap: (){
                            breedSheet(context);
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
                                Text(postCreateController!.selectBreed.value==""?"Select Breed":postCreateController!.selectBreed.value,style: mediumText(16.sp,color: textColor),),
                                Icon(Icons.keyboard_arrow_right,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ):SizedBox(),
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
                                Text(postCreateController!.darftPostModel!.age!=null?convertToYearsAndMonths(postCreateController!.darftPostModel!.age!.toInt()):"Select pet age",style: mediumText(16.sp,color: textColor),),
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
                                Text(postCreateController!.darftPostModel!.weight!=null?convertToKilogramsAndGrams(postCreateController!.darftPostModel!.weight!.toInt()):"Select pet weight",style: mediumText(16.sp,color: textColor),),
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
    ),
);
  }

  void breedSheet(BuildContext context){
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
                                  Text("Breeds",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
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
                              itemCount: postCreateController!.breedList!.value.where((element) => element.origin==postCreateController!.selectOriginId.value).length,
                              gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 11.0,
                                crossAxisSpacing: 0.0,
                                childAspectRatio:4/5,
                              ),
                              itemBuilder:(context,index){
                                return InkWell(
                                  onTap: (){
                                    postCreateController!.patBreedUpdate(postCreateController!.breedList!.value.where((element) => element.origin==postCreateController!.selectOriginId.value).toList()[index]);
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(postCreateController!.breedList!.value.where((element) => element.origin==postCreateController!.selectOriginId.value).toList()[index].breedName!.length>5?postCreateController!.breedList!.value.where((element) => element.origin==postCreateController!.selectOriginId.value).toList()[index].breedName!.substring(0,5)+"..":postCreateController!.breedList!.value.where((element) => element.origin==postCreateController!.selectOriginId.value).toList()[index].breedName!,style: mediumText(14.sp,color: appBarTitleTextColor),)
                                    ],
                                  ),
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
  void originSheet(BuildContext context){
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
                                  Text("Origins",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
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
                              itemCount: postCreateController!.originList!.value.where((element) => element.category==postCreateController!.selectCategoryId.value).length,
                              gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 11.0,
                                crossAxisSpacing: 0.0,
                                childAspectRatio:4/5,
                              ),
                              itemBuilder:(context,index){
                                return InkWell(
                                  onTap: (){
                                    postCreateController!.patOriginUpdate(postCreateController!.originList!.value.where((element) => element.category==postCreateController!.selectCategoryId.value).toList()[index]);
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(postCreateController!.originList!.value.where((element) => element.category==postCreateController!.selectCategoryId.value).toList()[index].originName!.length>5?postCreateController!.originList!.value.where((element) => element.category==postCreateController!.selectCategoryId.value).toList()[index].originName!.substring(0,5)+"..":postCreateController!.originList!.value.where((element) => element.category==postCreateController!.selectCategoryId.value).toList()[index].originName!,style: mediumText(14.sp,color: appBarTitleTextColor),)
                                    ],
                                  ),
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
  void categorSheet(BuildContext context,List<Category> categoryList){
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
                              itemCount: categoryList.length,
                              gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 11.0,
                                crossAxisSpacing: 0.0,
                                childAspectRatio:4/5,
                              ),
                              itemBuilder:(context,index){
                                return InkWell(
                                  onTap: (){
                                    postCreateController!.patCatergoryUpdate(categoryList[index]);
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:categoryList[index].icon!,
                                        placeholder: (context, url) => SizedBox(
                                            height: 50,
                                            child: LoadingWidget()),
                                        imageBuilder: (context, image) =>
                                            Container(
                                              height: 74.h,
                                              width: 74.w,
                                              padding: EdgeInsets.all(13),
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius,
                                                border: Border.all(color: borderColor),
                                              ),
                                              child: Image(image: image),
                                            ),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text(categoryList[index].categoryName!.length>5?categoryList[index].categoryName!.substring(0,5)+"..":categoryList[index].categoryName!,style: mediumText(14.sp,color: appBarTitleTextColor),)
                                    ],
                                  ),
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
                                    value:_currentValue,
                                    minValue: 0,
                                    maxValue: 100,
                                    selectedTextStyle: TextStyle(
                                        color: textColor,
                                        fontSize: 32.sp
                                    ),
                                    haptics: true,
                                    onChanged: (value) => setState((){
                                      _currentValue = value;
                                    }),
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
                                      postCreateController!.patAgeUpdate(_currentValue,_currentValue2);
                                      Navigator.pop(context);
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
                                      postCreateController!.patWeightUpdate(_currentValue,_currentValue2);
                                      Navigator.pop(context);
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



  String convertToYearsAndMonths(int days) {
    int months=days~/30;
    int years = months ~/ 12;  // Get the whole number of years
    int remainingMonths = months % 12;  // Get the remaining months
    String result = '';
    if (years > 0) {
      result += '$years year${years > 1 ? 's' : ''} ';
    }
    if (remainingMonths > 0) {
      result += '$remainingMonths month${remainingMonths > 1 ? 's' : ''}';
    }

    return result.trim();
  }

  String convertToKilogramsAndGrams(int grams) {
    int kilograms = grams ~/ 1000; // Get the whole number of kilograms
    int remainingGrams = grams % 1000; // Get the remaining grams

    String result = '';

    if (kilograms > 0) {
      result += '$kilograms kg ';
    }

    if (remainingGrams > 0) {
      result += '$remainingGrams g';
    }

    return result.trim();
  }
}
