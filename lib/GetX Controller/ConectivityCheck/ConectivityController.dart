import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


class ConnectivityController extends GetxController implements GetxService{

  ConnectivityController();

  var isOffline = false.obs;
  BuildContext? conext;
  
  

  @override
  void onInit() async{

   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!\
     Logger().e(result.name);
     if(result.name=="none"){
       isOffline.value =false;
       Get.snackbar(
         "You have no internet",
         "You have no internet",
         borderRadius: 0,
         margin: EdgeInsets.all(0),
         backgroundColor: Colors.redAccent,
         icon: Icon(Icons.network_check_sharp, color: Colors.white),
         snackPosition: SnackPosition.BOTTOM,
         duration: Duration(days: 1)
       );
     }else{
       isOffline.value =true;
     }
    });



   final connectivityResult = await (Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile) {
     // I am connected to a mobile network.
     isOffline.value =true;

   } else if (connectivityResult == ConnectivityResult.wifi) {
     // I am connected to a wifi network.
     isOffline.value =true;
   } else if (connectivityResult == ConnectivityResult.ethernet) {
     // I am connected to a ethernet network.
     isOffline.value =true;
   } else if (connectivityResult == ConnectivityResult.vpn) {
     // I am connected to a vpn network.
     // Note for iOS and macOS:
     // There is no separate network interface type for [vpn].
     // It returns [other] on any device (also simulator)
     isOffline.value =true;
   } else if (connectivityResult == ConnectivityResult.bluetooth) {
     // I am connected to a bluetooth.
     isOffline.value =true;
   } else if (connectivityResult == ConnectivityResult.other) {
     // I am connected to a network which is not in the above mentioned networks.
     isOffline.value =true;
   } else if (connectivityResult == ConnectivityResult.none) {
     // I am not connected to any network.
     isOffline.value =false;
     Get.snackbar(
         "You have no internet",
         "Check your internet Connection",
         borderRadius: 0,
         margin: EdgeInsets.all(0),
         backgroundColor: Colors.redAccent,
         icon: Icon(Icons.network_check_sharp, color: Colors.white),
         snackPosition: SnackPosition.BOTTOM,
         duration: Duration(days: 1)
     );
   }


    super.onInit();
  }

  
  void setContext(BuildContext context){
    conext=context;
  }

}