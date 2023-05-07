import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


class ConnectivityController extends GetxController implements GetxService{

  ConnectivityController();

  var isOffline = false.obs;


  @override
  void onInit() {

   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!\
     Logger().e(result.name);
     if(result.name=="none"){
       isOffline.value =false;
     }else{
       isOffline.value =true;
     }
    });

    super.onInit();
  }


}