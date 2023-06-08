import 'package:AdopBox/GetX%20Controller/CategoryController/CategoryController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../../Data/Model/Category/Category.dart';
import '../../../Widgets/Loading/loading_widget.dart';

class PatCategoryCard extends StatelessWidget {
  final Category? category;
  final int? index;
  final CategoryController? controller;


  const PatCategoryCard({Key? key, this.category, this.controller, this.index,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color:controller!.categoriesList.value.contains(category!.id)?kPrimaryColorx: borderColor)
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(child:
          CachedNetworkImage(
            imageUrl: category!.icon!,
            placeholder: (context, url) => LoadingWidget(),
            imageBuilder: (context, image) =>
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: image,
                        scale: 1.0,
                      )
                  ),
                ),
          )
          ),
          SizedBox(width: 12,),
          Expanded(child: Text(category!.categoryName ?? '',
            style: mediumText(14.sp, color: textColor),
            textAlign: TextAlign.start,)),
          Expanded(
              child: Checkbox(
                  value: controller!.categoriesList.value.contains(
                      category!.id),
                  onChanged: (onChanged) {
                    controller!.CategorySelec(index!);
                  })
          )
        ],
      ),
    );
  }
}
