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
                      aspectRatio: 20 / 7,
                      viewportFraction: 0.9,
                      // enlargeFactor: 0.3,
                      // enlargeCenterPage: true,
                      onPageChanged: (int page, css) {
                        controller.currentIndex.value = page;
                      }
                  ),
                  items: data!.getData!.map((slider) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 0.90.sw,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kPrimaryColorx.shade300,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                        //   decoration: BoxDecoration(
                                        //       color: Color(0xFFF08F4F).withOpacity(0.75),
                                        //       borderRadius: BorderRadius.circular(50)
                                        //   ),
                                        //   child: Text(
                                        //     slider.heading!,
                                        //     style: regularText(
                                        //         13, color: Color(0XFFFBE3D3)),),
                                        // ),
                                        // SizedBox(height: 8.h,),
                                        Text(
                                          slider.bannerTitle!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            height: 1.25,
                                          ),),
                                        // SizedBox(height: 12.h,),
                                        // CustomButton(orderRadius: 4,
                                        //     height: 29,
                                        //     width: 83,
                                        //     color: Colors.white,
                                        //     textColor: kPrimaryColorx,
                                        //     title: "Details",
                                        //     onTap: () {
                                        //
                                        //     }),
                                      ],
                                    ),
                                  )
                              ),
                              Expanded(
                                flex:7,
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.only(right: 12),
                                    child: CachedNetworkImage(
                                      imageUrl: slider.photo!,
                                      placeholder: (context, url) => LoadingWidget(),
                                      imageBuilder: (context, image) =>  Container(

                                        decoration:  BoxDecoration(
                                            borderRadius:  BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: image,
                                              scale: 1.0,

                                            )
                                        ),
                                      ),
                                    )
                                ),
                              )
                            ],
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


