import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';

import '../Data/Model/Location/location_model.dart';

class LocationNameService{


Future<List<Placemark>?> getLocationName(double? lat,double? lon)async {
  List<Placemark>? placemarks;
  Logger().i(lat);
  try{
    placemarks = await placemarkFromCoordinates(lat!, lon!);
    Logger().d(placemarks);
  }catch(e){
    if(e is PlatformException){
      print(e.message);
    }
  }
return placemarks!;
}
}

