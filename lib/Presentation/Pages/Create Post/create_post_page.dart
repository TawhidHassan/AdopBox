import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/GetX%20Controller/PostCreate/PostCreateController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/darft_icon_widget.dart';
import 'Component/other_info.dart';
import 'Component/persoonal_details.dart';
import 'Component/pet_info.dart';

class CreatePostPage extends StatelessWidget {
  final bool? isLogin;
  CreatePostPage({Key? key, this.isLogin}) : super(key: key);

 var postCreateController= Get.find<PostCreateController>();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,(){
      Get.find<PostCreateController>().onSystemInit();
      Get.find<PostCreateController>().getCategoryBreedOrigin();
    });
    return  GetBuilder<PostCreateController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Create"),
            leading: BackButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context,MAIN_PAGE);
              },
            ),
            actions: [
              DraftIconCount(),
              SizedBox(width: 24,)
            ],
          ),
          body:isLogin!?PageView(
            controller: controller.controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              PersonalDetails(postCreateController: controller),
              Petinfo(postCreateController: controller),
              OtherInfo(postCreateController: controller),
            ],
          ):Container(
            height: 1.0.sh,
            width: 1.0.sw,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/login.svg"),
                  SizedBox(height: 12,),
                  Text(
                    'You are not login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8A96A9),
                      fontSize: 16,
                      fontFamily: 'Maven Pro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,LOGIN_PAGE);
                    },
                    child: Text(
                      'Login now >>',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColorx,
                        fontSize: 16,
                        fontFamily: 'Maven Pro',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
