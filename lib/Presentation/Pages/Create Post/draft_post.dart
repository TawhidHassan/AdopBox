import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../GetX Controller/PostCreate/PostCreateController.dart';
import 'Component/draft_card.dart';

class DraftPostPage extends StatelessWidget {
  const DraftPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PostCreateController>().onInit();
    return Scaffold(
      appBar: AppBar(
        title: Text("Draft post"),
      ),
      body: GetBuilder<PostCreateController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    controller.postDraftList!.value.length.toString()+' posts',
                    style: TextStyle(
                      color: Color(0xFF101836),
                      fontSize: 16,
                      fontFamily: 'Maven Pro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  width: 1.0.sw,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFFB4C2D4)),
                ),
                SizedBox(height: 12,),
                ListView.builder(
                    shrinkWrap: true,
                  itemCount: controller.postDraftList!.value.length,
                    itemBuilder: (contex,index){
                      return Draftcard(postCreate:controller.postDraftList!.value[index] ,);
                    }
                  )
              ],
            );
          });
        },
      ),
    );
  }
}
