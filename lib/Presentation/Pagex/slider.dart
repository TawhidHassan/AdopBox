import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../GetX Controller/Slider/SliderController.dart';

class Sliderx extends GetView<SliderController> {
  const Sliderx({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // controller.increment();

    return Scaffold(
     appBar: AppBar(title: Text("slider"),),
      body: Center(
        child: Text(controller.currentIndex.toString()),
      ),
    );
  }
}
