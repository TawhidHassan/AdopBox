import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Repository/SliderRepository/slider_repository.dart';

class PostCreateController extends GetxController implements GetxService{
  final SliderRepository? sliderRepository;

  PostCreateController({ this.sliderRepository});

  final currentIndex = 0.obs;
  PageController controller=PageController(initialPage: 0, keepPage: false);

  // Rx<LocationModel?>  location=Rx<LocationModel?>(null);
  // increment() {
  //   currentIndex.value++;
  //   print("object");
  //
  //   sliderRepository!.getCheck();
  // }
}