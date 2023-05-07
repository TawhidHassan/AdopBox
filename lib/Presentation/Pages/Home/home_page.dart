import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/ConectivityCheck/ConectivityController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


import '../../../Constants/Strings/app_strings.dart';
import '../../../GetX Controller/Home/HomeController.dart';
import '../../Widgets/TextField/icon_bg_textfield.dart';
import 'Component/category_component.dart';
import 'Component/home_slider.dart';
import 'Component/recent_post_component.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            toolbarHeight: 108.h,
            title: Row(
              children: [
                SvgPicture.asset("assets/icons/location.svg"),
                SizedBox(width: 10.w,),
                Obx(() {
                  return Text(controller.adress.value,
                    style: mediumText(14.sp, color: textColor),);
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                color: whiteBackground,
                height: 60.h,
                child: IconBackgroundTextfield(
                  bgColor: whiteBackground,
                  controller: null,
                  hintText: "Search here",
                  isNumber: false,
                  readOnly: false,
                  borderColor: borderColor,
                  icons: "assets/icons/search.svg",
                ),
              ),
            ),
            actions: [
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
          body: Container(
            color: Colors.white,
            height: 1.0.sh,
            width: 1.0.sw,
            child: RefreshIndicator(
              onRefresh: () => refreshList(context),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  GetBuilder<ConnectivityController>(
                    assignId: true,
                    builder: (controller) {
                      return Obx(() {
                        return controller.isOffline.value?SliverToBoxAdapter(child: SizedBox()): SliverToBoxAdapter(
                            child: Container(
                              height: 36.h,
                              padding: EdgeInsets.all(10),
                              color: Color(0XFFFFE7D6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_off, color: Color(0xFFDB2B24),
                                    size: 16.sp,),
                                  SizedBox(width: 12.sp,),
                                  Text(
                                    "you are offline. Check your internet connection.",
                                    style: regularText(
                                        14.sp, color: Color(0xFFDB2B24)),)
                                ],
                              ),
                            )
                        );
                      });
                    },
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h,),),
                  SliverToBoxAdapter(
                      child: HomeSlider()
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 28.h,),),
                  SliverToBoxAdapter(
                      child: CategoryComponent()
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 28.h,),),
                  SliverToBoxAdapter(
                      child: RecentPostComponent()
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> refreshList(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    Get.find<HomeController>().getLocationName();
  }

}