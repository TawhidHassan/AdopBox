import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Data/Model/Location/location_model.dart';
import '../../Dependenci Injection/injection.dart';
import '../../Repository/SliderRepository/slider_repository.dart';
import '../../Utils/MapUtils/Utils.dart';
import '../../service/location_service.dart';
import '../../service/location_service_name.dart';

class HomeController extends GetxController implements GetxService{
  final SliderRepository? sliderRepository;

  HomeController({ this.sliderRepository});

  Rx<LocationModel?>  location=Rx<LocationModel?>(null);
  var locationService = getIt<LocationService>();
  var locationNameService = getIt<LocationNameService>();
  Rx<LatLng?> latLng=Rx<LatLng?>(null);
  final adress="Getting Location".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    locationService.getLocation().then((value){
      location.value=value;
      latLng.value=LatLng(location.value!.latitude!,location.value!.longitude!);
      locationNameService.getLocationName(location.value!.latitude!, location.value!.longitude!).then((valuex){
        adress.value=valuex![0].locality.toString() +
            "," +
            valuex[0].subLocality.toString()+","+valuex[0].street.toString();
      });
    });
    super.onInit();
  }

  getLocationName(){
    locationService.getLocation().then((value){
      location.value=value;
      latLng.value=LatLng(location.value!.latitude!,location.value!.longitude!);
      locationNameService.getLocationName(location.value!.latitude!, location.value!.longitude!).then((valuex){
        adress.value=valuex![0].locality.toString() +
            "," +
            valuex[0].subLocality.toString()+","+valuex[0].street.toString();
      });
    });
  }

}