import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:AdopBox/GetX%20Controller/Post/PostController.dart';
import 'package:AdopBox/Presentation/Pages/Home/Component/post_card.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Button/custom_button.dart';


class RecentPostComponent extends StatelessWidget {
  const RecentPostComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/border.svg"),
              SizedBox(width: 12.w,),
              Text(
                "Recent post",
                style: semiBoldText(20.sp, color: appBarTitleTextColor),)
            ],
          ),
          SizedBox(height: 10.h,),
          GetBuilder<PostController>(
            assignId: true,
            builder: (controller) {
              return Obx(() {
                return controller.circuler.value?LoadingWidget():
                    controller.postResponse.value==null||controller.postResponse.value!.getData!.isEmpty?
                        SizedBox():
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.postResponse.value!.getData!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 13.0,
                      crossAxisSpacing: 13.0,
                      childAspectRatio: 4 / 6,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, POST_DETAILS,arguments: {
                            'id':controller.postResponse.value!.getData![index].id,
                            'catId':controller.postResponse.value!.getData![index].category!.id,
                          });
                        },
                        child: Postcard(
                          title: controller.postResponse.value!.getData![index].postTitle,
                          image:controller.postResponse.value!.getData![index].photos![0],
                          price: controller.postResponse.value!.getData![index].price!=null?
                          controller.postResponse.value!.getData![index].price!.toString():"Adoption",

                        ),
                      );
                    }
                );
              });
            },
          ),
          SizedBox(height: 20.h,),
          CustomButton(
              height: 48.h,
              borderRadius: 4,
              color: kPrimaryColorx,
              textColor: Colors.white,
              title: "See all post",
              onTap: () {
                Navigator.pushNamed(context, ALL_POST_PAGE,);
              }),
          SizedBox(height: 13.h,),
        ],
      ),
    );
  }
}
