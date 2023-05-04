import 'package:AdopBox/GetX%20Controller/PostCreate/PostCreateController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'Component/other_info.dart';
import 'Component/persoonal_details.dart';
import 'Component/pet_info.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostCreateController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Create"),
          ),
          body:PageView(
            controller: controller.controller,
            children: [
              PersonalDetails(postCreateController: controller),
              Petinfo(postCreateController: controller),
              OtherInfo(postCreateController: controller),
            ],
          ),
        );
      },
    );
  }
}
