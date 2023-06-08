import 'package:AdopBox/GetX%20Controller/PostCreate/PostCreateController.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Config/text_style.dart';
import '../../Constants/Colors/app_colors.dart';
import '../../Constants/Strings/app_strings.dart';

class DraftIconCount extends StatelessWidget {
  final double? padidng;
  final double? top;
  final double? start;

  const DraftIconCount(
      {Key? key, this.padidng = 7, this.top = -2, this.start = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PostCreateController>().onInit();
    return GetBuilder<PostCreateController>(
      builder: (controller) {
        return Obx(() {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            child: controller.postDraftList!.value.length > 0 ?
            badges.Badge(
              stackFit: StackFit.passthrough,
              badgeContent: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(controller.postDraftList!.value.length.toString(),
                  style: boldText(11, color: Colors.white),),
              ),
              position: BadgePosition.custom(top: top, start: start),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: kPrimaryColorx,
                padding: EdgeInsets.all(padidng!),
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.white, width: 2.5),

                // badgeGradient: badges.BadgeGradient.linear(
                //   colors: [Colors.blue, Colors.yellow],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                elevation: 0,
              ),
              child: InkWell(
                onTap: () {
                  controller.localDataGet?.getItem().then((value) {

                  });
                },
                child: Icon(Icons.drafts),
              ),
            ) : InkWell(
              onTap: () {
                // Navigator.pushNamed(context, CART_PAGE);
              },
              child: Icon(Icons.drafts),
            ),
          );
        });
      },
    );
  }
}
