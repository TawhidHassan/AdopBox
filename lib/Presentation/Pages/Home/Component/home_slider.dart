
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../../GetX Controller/Slider/SliderController.dart';
import '../../../Widgets/Button/custom_button.dart';
import '../../../Widgets/Loading/loading_widget.dart';


class HomeSlider extends StatelessWidget {
  HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SliderController>(
      assignId: true,
      builder: (controller) {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  aspectRatio: 20/7,
                  viewportFraction: 0.9,
                  // enlargeFactor: 0.3,
                  // enlargeCenterPage: true,
                  onPageChanged: (int page, css) {
                    controller.currentIndex.value = page;
                  }
              ),
              items: ["tata","jajka","kakaka"].map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 0.90.sw,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: kPrimaryColorx.shade300,
                      ),
                      child:Text("ddd"),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10.h,),
            Obx(() {
              return CarouselIndicator(
                height: 8.h,
                color: kPrimaryColorx.shade100,
                activeColor: kPrimaryColorx,
                count: 3,
                index: controller.currentIndex.value,
              );
            }),
          ],
        );
      },
    );
  }
}


