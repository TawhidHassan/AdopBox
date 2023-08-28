import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../Bloc/Slider/slider_cubit.dart';
import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../../GetX Controller/Slider/SliderController.dart';
import '../../../Widgets/Button/custom_button.dart';
import '../../../Widgets/Loading/loading_widget.dart';


class HomeSlider extends StatelessWidget {
  HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SliderCubit>(context).getSlider();
    return GetBuilder<SliderController>(
      assignId: true,
      builder: (controller) {
        return BlocBuilder<SliderCubit, SliderState>(
          builder: (context, state) {
            if(state is !SlidersGet){
              return Center(child: LoadingWidget(),);
            }
            final data=(state as SlidersGet).sliderResponse;
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      aspectRatio: 15 / 6,
                      // enlargeFactor: 0.3,
                      // enlargeCenterPage: true,
                      onPageChanged: (int page, css) {
                        controller.currentIndex.value = page;
                      }
                  ),
                  items: data!.getData!.map((slider) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CachedNetworkImage(
                          imageUrl: slider.photo!,
                          placeholder: (context, url) => LoadingWidget(),
                          imageBuilder: (context, image) =>  Container(
                            width: 0.9.sw,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: image,
                                  fit: BoxFit.fill
                                )
                            ),
                          ),
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
                    count: data.getData!.length,
                    index: controller.currentIndex.value,
                  );
                }),
              ],
            );
          },
        );
      },
    );
  }
}


