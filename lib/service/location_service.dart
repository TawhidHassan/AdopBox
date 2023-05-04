import 'dart:async';

import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';

import '../Data/Model/Location/location_model.dart';

class LocationService{
  Location location=Location();
  LocationModel?  currentLocation;

  StreamController<LocationModel>locationController= StreamController<LocationModel>.broadcast();

  Stream<LocationModel> get getData=>locationController.stream;

  LocationService(){
    location.requestPermission().then((value){
      if(value==PermissionStatus.granted){
        location.onLocationChanged.listen((event) {
          locationController.add(LocationModel(latitude: event.latitude,longitude: event.longitude));
        });
      }
    });
  }


  Future<LocationModel?> getLocation()async {
    try{
      var userLoction=await location.getLocation();
      currentLocation=LocationModel(longitude: userLoction.longitude,latitude: userLoction.latitude);
      Logger().w(currentLocation!.latitude);
    }catch(e){
      if(e is PlatformException){
        print(e.message);
      }
    }

    return  currentLocation;
  }

}