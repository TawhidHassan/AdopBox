import 'dart:async';

import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../../GetX Controller/Post/PostController.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/TextField/bg_textfield.dart';
import '../Home/Component/post_card.dart';


class AllPostPage extends StatelessWidget {
  AllPostPage({Key? key}) : super(key: key);

  TextEditingController miniTextController=TextEditingController();
  TextEditingController maxiTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.find<PostController>().getAllPost();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteBackground,
        title: Text(
          "All post", style: semiBoldText(18.sp, color: appBarTitleTextColor),),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20.w),
              child: SvgPicture.asset(
                "assets/icons/search.svg", color: unSelectTextColor,)),

          PopupMenuButton<int>(
            position: PopupMenuPosition.under,
            constraints: BoxConstraints(maxWidth: 230.w, minWidth: 230.w),
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.more_vert, color: Color(0xff231F20), size: 24.sp,)
            ),
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                value: 0,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, SET_PREFERENCE_PAGE);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/more-2.svg"),
                          SizedBox(width: 13.w,),
                          Text('Change preference', style: mediumText(
                              16.sp, color: appBarTitleTextColor),)
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(color: dividerColor, thickness: 1,)
                  ],
                ),
              ),
              PopupMenuItem(
                  value: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SET_RADIUS_PAGE);
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/radar.svg"),
                            SizedBox(width: 13.w,),
                            Text('Set radius', style: mediumText(
                                16.sp, color: appBarTitleTextColor),)
                          ],
                        ),
                      ],
                    ),
                  )
              ),

            ],
          ),
        ],
      ),

      body: GetBuilder<PostController>(
        assignId: true,
        builder: (controller) {
          return SizedBox(
            height: 1.0.sh,
            width: 1.0.sw,
            child: GetBuilder<PostController>(
              assignId: true,
              builder: (controller) {
                return Obx(() {
                  return Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                controller.allPostCirculer.value?SizedBox():
                                Text(controller.list.length.toString()+" posts", style: mediumText(
                                    16.sp, color: textColor),),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        categorSheet(context,controller);
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/icons/more-2.svg"),
                                          SizedBox(width: 10.w,),
                                          Text('Category', style: mediumText(
                                              16.sp,
                                              color: appBarTitleTextColor),)
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 22.w,),
                                    InkWell(
                                      onTap: () {
                                        filterSheet(context,controller);
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/icons/filter.svg"),
                                          SizedBox(width: 10.w,),
                                          Text('Filter', style: mediumText(
                                              16.sp,
                                              color: appBarTitleTextColor),)
                                        ],
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          )
                      ),
                      Expanded(
                          flex: controller.postType==""&&controller.categoryId.value==""&&controller.minumPrice.value==""&&controller.maximumPrice.value==""?1:3,
                          child:Column(
                          children: [
                            Divider(color: borderColor, thickness: 2,),
                            Row(
                              children: [
                                controller.categoryId.value==""?SizedBox()
                                    :
                                Container(
                                  margin: EdgeInsets.only(left:16),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 6),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: dividerColor),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              controller.categorySelect.value,
                                              style: mediumText(14, color: textColorTwo),),
                                            SizedBox(width: 4,),
                                            InkWell(
                                                onTap: (){
                                                  controller.categorySelect.value="";
                                                  controller.categoryId.value="";
                                                  Get.find<PostController>().getAllPost();
                                                },
                                                child: Icon(Icons.close,color: dividerColor,size: 18,))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                controller.postType==""?SizedBox()
                                    :
                                Container(
                                  margin: EdgeInsets.only(left:16),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 6),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: dividerColor),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              controller.postType=="1"?"Free":"Paid",
                                              style: mediumText(14, color: textColorTwo),),
                                            SizedBox(width: 4,),
                                            InkWell(
                                                onTap: (){
                                                  controller.updateType(0);
                                                  Get.find<PostController>().getAllPost();
                                                },
                                                child: Icon(Icons.close,color: dividerColor,size: 18,))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                controller.minumPrice.value==""?SizedBox()
                                    :
                                Container(
                                  margin: EdgeInsets.only(left:16),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 6),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: dividerColor),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Minimum "+controller.minumPrice.value,
                                              style: mediumText(14, color: textColorTwo),),
                                            SizedBox(width: 4,),
                                            InkWell(
                                                onTap: (){
                                                  controller.minumPrice.value="";
                                                  controller.getAllPost();
                                                },
                                                child: Icon(Icons.close,color: dividerColor,size: 18,))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                controller.maximumPrice.value==""?SizedBox()
                                    :
                                Container(
                                  margin: EdgeInsets.only(left:16),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 6),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: dividerColor),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Maximum "+controller.maximumPrice.value,
                                              style: mediumText(14, color: textColorTwo),),
                                            SizedBox(width: 4,),
                                            InkWell(
                                                onTap: (){
                                                  controller.maximumPrice.value="";
                                                  controller.getAllPost();

                                                },
                                                child: Icon(Icons.close,color: dividerColor,size: 18,))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ],
                       )
                      ),
                      Expanded(
                        flex: 35,
                        child:controller.allPostCirculer.value?
                        LoadingWidget()
                            :
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 20),
                          child: GridView.builder(
                               controller:controller.controller,
                              itemCount: controller.list.length + (controller.postPagingCirculer.value ? 1 : 0),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 13.0,
                                crossAxisSpacing: 13.0,
                                childAspectRatio: 4 / 6,
                              ),
                              itemBuilder: (context, index) {
                                if (index < controller.list.length) {
                                  return Postcard(
                                    title: controller.list[index].postTitle,
                                    image:controller.list[index].photos![0],
                                    price: controller.list[index].price!=null?
                                    controller.list[index].price!.toString():"Adoption",
                                  );
                                } else {
                                  Timer(const Duration(milliseconds: 30), () {
                                    controller.controller
                                        .jumpTo(controller.controller.position
                                        .maxScrollExtent);
                                  });
                                  return const Center(
                                    child: CircularProgressIndicator(),);
                                }
                              }
                          ),
                        ),
                      ),
                    ],
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }


  void categorSheet(BuildContext context,PostController postController) {
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
                                  Text("Categories", style: semiBoldText(
                                      20.sp, color: appBarTitleTextColor),)
                                ],
                              ),
                            ),
                            Divider(color: unSelectColor, thickness: 2,)
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 13,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: postController.categoryResponse.value!.getData!.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 11.0,
                                crossAxisSpacing: 0.0,
                                childAspectRatio: 4 / 5,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    postController.categoryId.value=postController.categoryResponse.value!.getData![index].id!;
                                    postController.categorySelect.value=postController.categoryResponse.value!.getData![index].categoryName!;
                                    Get.find<PostController>().getAllPost();
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: postController.categoryResponse.value!.getData![index].icon!,
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
                                      Text(postController.categoryResponse.value!.getData![index].categoryName!.length>5?postController.categoryResponse.value!.getData![index].categoryName!.substring(0,6)+"..":postController.categoryResponse.value!.getData![index].categoryName!, style: mediumText(
                                          14.sp, color: appBarTitleTextColor),)
                                    ],
                                  ),
                                );
                              }
                          ),
                        ),
                      ),

                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Divider(color: unSelectColor, thickness: 2,),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 6),
                                child: CustomButton(
                                    height: 48.h,
                                    borderRadius: 4,
                                    color: kPrimaryColorx,
                                    textColor: Colors.white,
                                    title: "Apply",
                                    onTap: () {
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

  void filterSheet(BuildContext context,PostController postController) {
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
                                  Text("Filter", style: semiBoldText(
                                      20.sp, color: appBarTitleTextColor),)
                                ],
                              ),
                            ),
                            Divider(color: unSelectColor, thickness: 2,)
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
                                  Text("Post Type", style: semiBoldText(
                                      16.sp, color: textColor),),
                                  SizedBox(height: 12.h,),
                                  SizedBox(
                                    width: 1.0.sw,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap:(){
                                              postController.updateType(0);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: borderColor),
                                                  borderRadius: borderRadius
                                              ),
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: true,
                                                      groupValue: postController.postType=="",
                                                      onChanged: (onChanged) {
                                                        postController.updateType(0);
                                                        Navigator.pop(context);
                                                      }),
                                                  Text("All", style: mediumText(
                                                      16.sp, color: textColor),)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 13.w,),
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){
                                              postController.updateType(1);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: borderColor),
                                                  borderRadius: borderRadius
                                              ),
                                              child: Row(
                                                children: [
                                                  Radio(value: true,
                                                      groupValue: postController.postType=="1",
                                                      onChanged: (onChanged) {
                                                        postController.updateType(1);
                                                        Navigator.pop(context);

                                                      }),
                                                  Text("Free", style: mediumText(
                                                      16.sp, color: textColor),)
                                                ],
                                              ),
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
                                          child: InkWell(
                                            onTap:(){
                                              postController.updateType(2);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 13.h),
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: borderColor),
                                                  borderRadius: borderRadius
                                              ),
                                              child: Row(
                                                children: [
                                                  Radio(value: true,
                                                      groupValue: postController.postType=="2",
                                                      onChanged: (onChanged) {
                                                        postController.updateType(2);
                                                        Navigator.pop(context);
                                                      }),
                                                  Text("Paid", style: mediumText(
                                                      16.sp, color: textColor),)
                                                ],
                                              ),
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
                                  Text("Price range", style: semiBoldText(
                                      16.sp, color: textColor),),
                                  SizedBox(height: 12.h,),
                                  SizedBox(
                                    width: 1.0.sw,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: BackgroundTextfield(
                                            controller: miniTextController,
                                            readOnly: false,
                                            isNumber: true,
                                            isemail: false,
                                            hintText: "Minimum",
                                            bgColor: whiteBackground,
                                            isValueChnged: true,
                                            tap: (text){
                                              if(text.isEmpty){
                                                postController.minumPrice.value="";
                                              }else{
                                                postController.minumPrice.value=text;
                                              }


                                            },
                                            errormsg: "Please enter amount",
                                            borderColor: borderColor,),
                                        ),
                                        SizedBox(width: 13.w,),
                                        Expanded(
                                          child: BackgroundTextfield(
                                            controller: maxiTextController,
                                            readOnly: false,
                                            isNumber: true,
                                            isemail: false,
                                            hintText: "Maximum",
                                            bgColor: whiteBackground,
                                            errormsg: "Please enter amount",
                                            isValueChnged: true,
                                            tap: (text){
                                              if(text.isEmpty){
                                                postController.maximumPrice.value="";
                                              }else{
                                                postController.maximumPrice.value=text;
                                              }

                                            },
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
                            Divider(color: unSelectColor, thickness: 2,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 6),
                              child: CustomButton(
                                  height: 48.h,
                                  borderRadius: 4,
                                  color: kPrimaryColorx,
                                  textColor: Colors.white,
                                  title: "Apply",
                                  onTap: () {
                                    postController.getAllPost();
                                    postController.update();
                                    Navigator.pop(context);
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
