import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Button/custom_button.dart';
import '../Home/Component/recent_post_component.dart';
import 'Component/pet_info_card.dart';
import 'Component/related_post.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 326.h,
              width: 1.0.sw,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Image.png"),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Post title goes here",style: semiBoldText(18.sp,color: textColor),),
                  SizedBox(height: 4.h,),
                  Text("Posted - 12/05/23",style: mediumText(12.sp,color: unSelectTextColor),),
                  SizedBox(height: 12.h,),
                  Row(
                    children: [
                      Container(
                        margin:EdgeInsets.only(right: 6),
                        padding:EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFFAEFCF),
                          borderRadius: borderRadius,
                        ),
                        child: Text("Female",style: mediumText(12.sp,color: Color(0xFFE4B218)),),
                      ),
                      Container(
                        margin:EdgeInsets.only(right: 6),
                        padding:EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5D8F2),
                          borderRadius: borderRadius,
                        ),
                        child: Text("24 Kg",style: mediumText(12.sp,color: Color(0xFFE94AD9)),),
                      ),
                      Container(
                        padding:EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5E7D9),
                          borderRadius: borderRadius,
                        ),
                        child: Text("2.5 Year",style: mediumText(12.sp,color: Color(0xFFF2821A)),),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h,),
                  Divider(thickness: 1,color: unSelectColor,),
                  SizedBox(height: 12.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/taka.svg"),
                          SizedBox(width: 8.w,),
                          Text("200",style: boldText(20.sp,color: kPrimaryColorx),)
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
                  Divider(thickness: 1,color: unSelectColor,),
                  SizedBox(height: 24.h,),

                  Text("Pet info",style: semiBoldText(16.sp,color: textColor),),
                  SizedBox(height: 12.h,),
                  Row(
                    children: [
                      Expanded(
                          child: PetInfoCard(
                            value: "Tane",
                            title: "Tane/stray",
                            image:"assets/icons/pets.svg",
                            color: Color(0xFFF2994A),
                          )
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                          child: PetInfoCard(
                            value: "Yes",
                            title: "Vaccinated",
                            image:"assets/icons/injection.svg",
                            color: Color(0xFF2F80ED),
                          )
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                          child: PetInfoCard(
                            value: "No",
                            title: "Diseases",
                            image:"assets/icons/virus.svg",
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
                            value: "Cat",
                            title: "Category",
                            image:"assets/icons/pet_category.svg",
                            color: kPrimaryColorx,
                          )
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                          child: PetInfoCard(
                            value: "Cat",
                            title: "Origin",
                            image:"assets/icons/origin.svg",
                            color: Color(0xFF27AE60),
                          )
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                          child: PetInfoCard(
                            value: "Cat",
                            title: "Breed",
                            image:"assets/icons/stamp.svg",
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
                          Text("Location",style: semiBoldText(16.sp,color: textColor),),
                          SizedBox(height: 12.h,),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/location.svg",),
                              SizedBox(width: 10,),
                              Text("Mohammodpur, Dhaka",style: regularText(14.sp,color: textColor),),
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, POST_DIRECTION_PAGE);
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color:kPrimaryColorx,
                            borderRadius: borderRadius
                          ),
                          child: SvgPicture.asset("assets/icons/direction.svg"),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 24.h,),
                  Text("Description",style: semiBoldText(16.sp,color: textColor),),
                  SizedBox(height: 12.h,),
                  Text("If you are going to use a passage of lorem ipsum, you need to be sure there isn't anything embarras hidden in the middle of text.",style: regularText(14.sp,color: textColor),),
                  SizedBox(height: 24.h,),
                  Text("Terms and Conditions",style: semiBoldText(16.sp,color: textColor),),
                  SizedBox(height: 12.h,),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/dot.svg",),
                      SizedBox(width: 8,),
                      Text("If you are going to use a passage of",style: regularText(14.sp,color: textColor)),
                    ],
                  ),
                  SizedBox(height: 12.h,),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/dot.svg",),
                      SizedBox(width: 8,),
                      Text("If you are going to use a passage of",style: regularText(14.sp,color: textColor)),
                    ],
                  ),
                  SizedBox(height: 12.h,),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/dot.svg",),
                      SizedBox(width: 8,),
                      Text("If you are going to use a passage of",style: regularText(14.sp,color: textColor)),
                    ],
                  ),
                  SizedBox(height: 24.h,),
                  Divider(thickness: 1,color: unSelectColor,),
                  SizedBox(height: 12.h,),
                  Text("Relate post",style: semiBoldText(16.sp,color: textColor),),
                  SizedBox(height: 12.h,),

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RelatedPost(),
              )
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 90.h,),
          )
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        height: 68,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
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
                  Text("Jit Banik",style: semiBoldText(16.sp,color: textColor),)
                ],
              ),
            ),
            CustomButton(
                height: 32.h,
                borderRadius: 4,
                width: 103,
                color:kPrimaryColorx,
                textColor: Colors.white,
                title: "Connect",
                onTap: () {
                  // Navigator.pushNamed(context, Connect,);
                }),
          ],
        ),
      ),
    );
  }
}
