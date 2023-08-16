import 'dart:io';

import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:AdopBox/service/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Dependenci Injection/injection.dart';
import '../../../GetX Controller/Post/PostController.dart';
import '../../../Utils/MapUtils/Utils.dart';
import '../../Widgets/Button/custom_button.dart';

class SetRadiusPage extends StatelessWidget {
  SetRadiusPage({Key? key}) : super(key: key);


  double? lanx;
  double? lonx;
  double? distance;

  // void getCureentLocation()async{
  //
  //   var possition =Platform.isAndroid?   await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high):await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   setState(()  {
  //     lanx=possition.latitude;
  //     lonx=possition.longitude;
  //     _latLng=LatLng(lanx!,lonx!);
  //     distance= Geolocator.distanceBetween(lanx!, lonx!, widget.pjp!.point!.lattitude!.toDouble(), widget.pjp!.point!.longitude!.toDouble());
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // GetIt<LocationService>().ge

    return GetBuilder<MapController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            // appBar: AppBar(
            //   title: Text("Set radius"),
            // ),
            body: Container(
                height: 1.0.sh,
                width: 1.0.sw,
                child: Stack(
                  children: [
                    controller.latLng.value==null?Center(child: Text("loading"),):
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: controller.latLng.value!,
                        zoom: 9,
                      ),
                      myLocationEnabled: true,
                      // markers: Set<Marker>.of(_markers),
                      zoomControlsEnabled: false,
                      // onMapCreated: controller.onMapCreated,
                      mapType: controller.currentMapType,
                      circles: {
                        Circle( circleId: const CircleId('currentCircle'),
                          center: controller.latLng.value!,
                          radius:controller.radius.value*1609.34,
                          strokeWidth: 2,
                          fillColor: kPrimaryColorx.shade50,
                          strokeColor:  kPrimaryColorx,
                        ),
                      },
                    ),

                    SafeArea(
                        child: Align(
                        alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                      Get.find<PostController>().getAllPost();
                                    },
                                    child: Icon(Icons.keyboard_backspace_outlined,size: 24.sp,)),
                                SizedBox(width: 15.w,),
                                Text("Set radius",style: semiBoldText(18.sp,color: appBarTitleTextColor),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                          margin: EdgeInsets.only(bottom: 0.04.sh,left: 20,right: 20),
                          decoration: BoxDecoration(
                              color: whiteBackground,
                              borderRadius: borderRadius,
                              border: Border.all(color:borderColor)
                          ),
                          height: 162.h,
                          width: 1.0.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Set radius",style: boldText(14.sp,color: textColor),),
                              SizedBox(height: 16.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.radius.value.toInt().toString()+"Mi",style: semiBoldText(8.sp,color: textColor),),
                                  Text("10Mi",style: semiBoldText(8.sp,color: textColor),),
                                ],
                              ),
                              SizedBox(height: 2.h,),
                              Slider(
                                min: 0,
                                max: 20,
                                value: controller.radius.value,
                                onChanged: (value) {
                                  controller.radius.value=value;
                                },
                              ),
                              SizedBox(height: 20.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                      height: 36.h,
                                      width: 70.w,
                                      borderRadius: 4,
                                      color:kPrimaryColorx,
                                      textColor: Colors.white,
                                      title: "Set",
                                      onTap: () {
                                        Navigator.pop(context);
                                        Get.find<PostController>().getRecentPost();
                                        Get.find<PostController>().getAllPost();
                                      }),
                                  Row(
                                    children: [
                                      Text("selected radius:",style: regularText(12.sp,color: textColor),),
                                      Text(controller.radius.value.toInt().toString()+"Mi",style: boldText(16.sp,color: textColor),),
                                    ],
                                  )

                                ],
                              ),
                            ],
                          )

                      ),
                    ),

                  ],
                )
            ),
          );
        });
      },
    );
  }



}
