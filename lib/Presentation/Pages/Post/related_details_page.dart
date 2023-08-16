import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/Post/PostController.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Button/custom_button.dart';
import '../Home/Component/recent_post_component.dart';
import 'Component/pet_info_card.dart';
import 'Component/related_post.dart';

class RelatedPostDetailPage extends StatelessWidget {
  final String?id, catId;

  const RelatedPostDetailPage({Key? key, this.id, this.catId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.find<PostController>().onInit();
    Get.find<PostController>().getPostDetails(id);
    Get.find<PostController>().getRelated(id, catId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: GetBuilder<PostController>(

        builder: (controller) {
          return Obx(() {
            return controller.psotDetailsCirculer.value ?
            LoadingWidget() :
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 326.h,
                    width: 1.0.sw,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                controller.singlePost.value!.getData!
                                    .photos![0]),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.singlePost.value!.getData!.postTitle ?? "",
                          style: semiBoldText(18.sp, color: textColor),),
                        SizedBox(height: 4.h,),
                        Text("Posted - " + timeAgo(getCustomFormattedDateTime(
                            controller.singlePost.value!.getData!.createdAt!,
                            'MM-dd-yyy h:mm a')),
                          style: mediumText(12.sp, color: unSelectTextColor),),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 6),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFFAEFCF),
                                borderRadius: borderRadius,
                              ),
                              child: Text(
                                controller.singlePost.value!.getData!.gender ==
                                    1 ? "Male" : "Female",
                                style: mediumText(12.sp, color: Color(
                                    0xFFE4B218)),),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 6),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5D8F2),
                                borderRadius: borderRadius,
                              ),
                              child: Text(
                                convertToKilogramsAndGrams(
                                    controller.singlePost.value!.getData!
                                        .weight!.toInt()),
                                style: mediumText(12.sp, color: Color(
                                    0xFFE94AD9)),),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5E7D9),
                                borderRadius: borderRadius,
                              ),
                              child: Text(
                                convertToYearsAndMonths(
                                    controller.singlePost.value!.getData!.age!
                                        .toInt()),
                                style: mediumText(12.sp, color: Color(
                                    0xFFF2821A)),),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Divider(thickness: 1, color: unSelectColor,),
                        SizedBox(height: 12.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/taka.svg"),
                                SizedBox(width: 8.w,),
                                Text(controller.singlePost.value!.getData!
                                    .postType == 2
                                    ? controller.singlePost.value!.getData!
                                    .price.toString()
                                    : "Adoption", style: boldText(20.sp,
                                    color: kPrimaryColorx),)
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/heart.svg",),
                                SizedBox(width: 8.w,),
                                SvgPicture.asset("assets/icons/share.svg",),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Divider(thickness: 1, color: unSelectColor,),
                        SizedBox(height: 24.h,),

                        Text(
                          "Pet info",
                          style: semiBoldText(16.sp, color: textColor),),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Expanded(
                                child: PetInfoCard(
                                  value: "Tame",
                                  title: controller.singlePost.value!.getData!
                                      .petType ?? "",
                                  image: "assets/icons/pets.svg",
                                  color: Color(0xFFF2994A),
                                )
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                                child: PetInfoCard(
                                  value: "Yes",
                                  title: controller.singlePost.value!.getData!
                                      .vaccinated!
                                      ? "Vaccinated"
                                      : "Not Vaccinated",
                                  image: "assets/icons/injection.svg",
                                  color: Color(0xFF2F80ED),
                                )
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                                child: PetInfoCard(
                                  value: controller.singlePost.value!.getData!
                                      .vaccinated! ? "Yes" : "Not Any",
                                  title: "Diseases",
                                  image: "assets/icons/virus.svg",
                                  color: Color(0xFFEB5757),
                                )
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Expanded(
                                child: PetInfoCard(
                                  value: controller.singlePost.value!.getData!
                                      .category!.categoryName,
                                  title: "Category",
                                  image: "assets/icons/pet_category.svg",
                                  color: kPrimaryColorx,
                                )
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                                child: PetInfoCard(
                                  value: controller.singlePost.value!.getData!
                                      .origin!.originName,
                                  title: "Origin",
                                  image: "assets/icons/origin.svg",
                                  color: Color(0xFF27AE60),
                                )
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                                child: PetInfoCard(
                                  value: controller.singlePost.value!.getData!
                                      .breed!.breedName,
                                  title: "Breed",
                                  image: "assets/icons/stamp.svg",
                                  color: Color(0xFF2D9CDB),
                                )
                            ),
                          ],
                        ),

                        SizedBox(height: 50.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Location", style: semiBoldText(16.sp,
                                    color: textColor),),
                                SizedBox(height: 12.h,),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/location.svg",),
                                    SizedBox(width: 10,),
                                    Text(controller.adress.value,
                                      style: regularText(
                                          14.sp, color: textColor),),
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, POST_DIRECTION_PAGE);
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: kPrimaryColorx,
                                    borderRadius: borderRadius
                                ),
                                child: SvgPicture.asset(
                                    "assets/icons/direction.svg"),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 24.h,),
                        Text("Description",
                          style: semiBoldText(16.sp, color: textColor),),
                        SizedBox(height: 12.h,),
                        Text(
                          controller.singlePost.value!.getData!.description ??
                              '',
                          style: regularText(14.sp, color: textColor),),
                        SizedBox(height: 24.h,),
                        Text("Terms and Conditions",
                          style: semiBoldText(16.sp, color: textColor),),
                        SizedBox(height: 12.h,),
                        Column(
                          children:
                          controller.singlePost.value!.getData!
                              .termsAndConditions!.map((e) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset("assets/icons/dot.svg",),
                                    SizedBox(width: 8,),
                                    Text(e,
                                        style: regularText(
                                            14.sp, color: textColor)),
                                  ],
                                ),
                                SizedBox(height: 12.h,),
                              ],
                            );
                          }).toList(),
                        ),

                        Divider(thickness: 1, color: unSelectColor,),
                        SizedBox(height: 12.h,),
                        Text("Relate post",
                          style: semiBoldText(16.sp, color: textColor),),
                        SizedBox(height: 12.h,),


                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GetBuilder<PostController>(

                        builder: (controller) {
                          return Obx(() {
                            return controller.relatedCirculer.value ?
                            LoadingWidget() :
                            RelatedPost(
                              post: controller.relatedPostResponse.value!
                                  .getData,);
                          });
                        },
                      ),
                    )
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 90.h,),
                )
              ],
            );
          });
        },
      ),
      bottomSheet: GetBuilder<PostController>(

        builder: (controller) {
          return Obx(() {
            return controller.psotDetailsCirculer.value?LoadingWidget(): Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              height: 68,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, USER_DETAILS);
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0XFF332D58),
                          child: Image.asset("assets/images/user.png"),
                        ),
                        SizedBox(width: 8,),
                        Text(
                          controller.singlePost.value!.getData!.postUserName!,
                          style: semiBoldText(16.sp, color: textColor),)
                      ],
                    ),
                  ),
                  CustomButton(
                      height: 32.h,
                      borderRadius: 4,
                      width: 103,
                      color: kPrimaryColorx,
                      textColor: Colors.white,
                      title: "Connect",
                      onTap: () {
                        // Navigator.pushNamed(context, Connect,);
                      }),
                ],
              ),
            );
          });
        },
      ),
    );
  }


  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    var date = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(
        givenDateTime, true);
    var local = date.toLocal().toString();
    // print(local);
    final DateTime docDateTime = DateTime.parse(local);
    // return DateFormat(dateFormat).format(docDateTime);
    return docDateTime;
  }

  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1
          ? "year"
          : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1
          ? "month"
          : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1
          ? "week"
          : "weeks"} ago";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1
          ? "minute"
          : "minutes"} ago";
    return "just now";
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

  String convertToYearsAndMonths(int days) {
    int months = days ~/ 30;
    int years = months ~/ 12; // Get the whole number of years
    int remainingMonths = months % 12; // Get the remaining months
    String result = '';
    if (years > 0) {
      result += '$years year${years > 1 ? 's' : ''} ';
    }
    if (remainingMonths > 0) {
      result += '$remainingMonths month${remainingMonths > 1 ? 's' : ''}';
    }

    return result.trim();
  }
}
