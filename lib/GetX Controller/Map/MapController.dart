import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Data/Model/Location/location_model.dart';
import '../../Dependenci Injection/injection.dart';
import '../../Repository/SliderRepository/slider_repository.dart';
import '../../Utils/MapUtils/Utils.dart';
import '../../service/location_service.dart';

class MapController extends GetxController implements GetxService{
  final SliderRepository? sliderRepository;

  MapController({ this.sliderRepository});

  final currentIndex = 0.obs;
  final radius = 7.0.obs;
  Rx<LocationModel?>  location=Rx<LocationModel?>(null);
  var locationService = getIt<LocationService>();
  Rx<LatLng?> latLng=Rx<LatLng?>(null);
  GoogleMapController? googleMapController;
  MapType currentMapType = MapType.normal;

  @override
  void onInit() {
    // TODO: implement onInit
    locationService.getLocation().then((value){
      location.value=value;
      latLng.value=LatLng(location.value!.latitude!,location.value!.longitude!);
    });

    super.onInit();
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    googleMapController!.setMapStyle(Utils.mapStyles).whenComplete(() {
    });
  }
  // increment() {
  //   currentIndex.value++;
  //   print("object");
  //
  //   sliderRepository!.getCheck();
  // }
}