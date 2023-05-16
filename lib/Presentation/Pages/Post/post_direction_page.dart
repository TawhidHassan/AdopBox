import 'dart:io';

import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:AdopBox/service/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Dependenci Injection/injection.dart';
import '../../../Utils/MapUtils/Utils.dart';
import '../../Widgets/Button/custom_button.dart';

class PostDirectionPage extends StatelessWidget {
  PostDirectionPage({Key? key}) : super(key: key);


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
                        zoom: 14,
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      // markers: Set<Marker>.of(_markers),
                      zoomControlsEnabled: false,
                      onMapCreated: controller.onMapCreated,
                      mapType: controller.currentMapType,

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
                                    },
                                    child: Icon(Icons.keyboard_backspace_outlined,size: 24.sp,)),
                                SizedBox(width: 15.w,),
                                Text("Distance",style: semiBoldText(18.sp,color: appBarTitleTextColor),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                          margin: EdgeInsets.only(top: 0.15.sh),
                          decoration: BoxDecoration(
                              color: whiteBackground,
                              borderRadius: borderRadius,
                              border: Border.all(color:borderColor)
                          ),
                          height: 72,
                          width: 1.0.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("5km away",style: boldText(18.sp,color: textColor),),
                              Text("From your location",style: regularText(14.sp,color: textColor),),

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
