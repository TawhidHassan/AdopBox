import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:AdopBox/GetX%20Controller/PostCreate/PostCreateController.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Widgets/Button/custom_button.dart';
import '../../../Widgets/TextField/bg_textfield.dart';

class PersonalDetails extends StatelessWidget {
  final PostCreateController? postCreateController;

  const PersonalDetails({Key? key, this.postCreateController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0.sh,
      width: 1.0.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          postCreateController!.controller.jumpToPage(0);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 4.0, color: kPrimaryColorx),
                            ),
                          ),
                          child: Text("Personal details",
                            style: mediumText(12.sp, color: kPrimaryColorx),),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          postCreateController!.controller.jumpToPage(1);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 4.0, color: unSelectColor),
                            ),
                          ),
                          child: Text("Pet info",
                            style: mediumText(12.sp, color: unSelectColor),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          postCreateController!.controller.jumpToPage(2);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 4.0, color: unSelectColor),
                            ),
                          ),
                          child: Text("Other info",
                            style: mediumText(12.sp, color: unSelectColor),),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20,),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your name", style: mediumText(16.sp,),),
                        SizedBox(height: 4.h,),
                        BackgroundTextfield(
                          controller: null,
                          readOnly: false,
                          isNumber: false,
                          isemail: false,
                          height: 48.h,
                          hintText: "Name",
                          bgColor: whiteBackground,
                          errormsg: "Please enter amount",
                          borderColor: borderColor,)
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Phone Number", style: mediumText(
                          16.sp,),),
                        SizedBox(height: 4.h,),
                        BackgroundTextfield(
                          controller: null,
                          readOnly: false,
                          isNumber: false,
                          isemail: false,
                          height: 48.h,
                          hintText: "Phone",
                          bgColor: whiteBackground,
                          errormsg: "Please enter amount",
                          borderColor: borderColor,)
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Location", style: mediumText(16.sp,),),
                        SizedBox(height: 4.h,),
                        BackgroundTextfield(
                          controller: null,
                          readOnly: false,
                          isNumber: false,
                          isemail: false,
                          height: 48.h,
                          hintText: "Location",
                          bgColor: whiteBackground,
                          errormsg: "Please enter amount",
                          borderColor: borderColor,)
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    GetBuilder<MapController>(
                      assignId: true,
                      builder: (controller) {
                        return Obx(() {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: borderColor),
                                borderRadius: borderRadius
                            ),
                            height: 121.h,
                            child: controller.latLng.value == null
                                ? LoadingWidget()
                                : GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: controller.latLng.value!,
                                zoom: 14,
                              ),
                              myLocationEnabled: true,
                              // markers: Set<Marker>.of(_markers),
                              zoomControlsEnabled: false,
                              // onMapCreated: controller.onMapCreated,
                              mapType: controller.currentMapType,
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Divider(color: unSelectColor, thickness: 2,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            height: 48.h,
                            borderRadius: 4,
                            color: kPrimaryColorx,
                            textColor: Colors.white,
                            boder: true,
                            title: "Save draft",
                            onTap: () {

                            }),
                      ),
                      SizedBox(width: 11.w,),
                      Expanded(
                        child: CustomButton(
                            height: 48.h,
                            borderRadius: 4,
                            color: kPrimaryColorx,
                            textColor: Colors.white,
                            title: "Next",
                            onTap: () {
                              postCreateController!.controller.jumpToPage(1);
                              print(postCreateController!.controller.page);
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
