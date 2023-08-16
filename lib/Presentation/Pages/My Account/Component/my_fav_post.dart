import 'package:AdopBox/GetX%20Controller/Post/PostController.dart';
import 'package:AdopBox/Presentation/Widgets/EmptyCard/empty_widget.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../Widgets/TextField/bg_textfield.dart';
import '../../Home/Component/post_card.dart';


class MyfavPost extends StatelessWidget {
  const MyfavPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PostController>().getMyFavoraitPost();
    return GetBuilder<PostController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24),
            child: controller.myFavPostCirculer.value
                ? LoadingWidget():
            controller.myFavPostResponse.value!.getData!.isEmpty?
                EmptyWidget():
                 GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.myFavPostResponse.value!.getData!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13.0,
                  crossAxisSpacing: 13.0,
                  childAspectRatio: 4 / 6,
                ),
                itemBuilder: (context, index) {
                  return Postcard(
                    title: controller.myFavPostResponse.value!.getData![index]
                        .postTitle,
                    image: controller.myFavPostResponse.value!.getData![index]
                        .photos![0],
                    price: controller.myFavPostResponse.value!.getData![index]
                        .price != null ?
                    controller.myFavPostResponse.value!.getData![index].price!
                        .toString() : "Adoption",);
                }
            ),
          );
        });
      },
    );
  }
}
