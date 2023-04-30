import 'package:get/get.dart';

import '../../Repository/SliderRepository/slider_repository.dart';

class SliderController extends GetxController implements GetxService{
  final SliderRepository? sliderRepository;

  SliderController({ this.sliderRepository});

  final currentIndex = 0.obs;
  // Rx<LocationModel?>  location=Rx<LocationModel?>(null);
  // increment() {
  //   currentIndex.value++;
  //   print("object");
  //
  //   sliderRepository!.getCheck();
  // }
}