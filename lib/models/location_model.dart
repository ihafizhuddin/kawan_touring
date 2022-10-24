import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:location/location.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';

class LocationService extends ChangeNotifier {
// }

  // Location location = new Location();
  GeoPoint geoPoint = GeoPoint(0, 0);
  Position? position;
  // LocationService() async {}

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
  }

  // final LocationSettings locationSettings = LocationSettings(
  //   accuracy: LocationAccuracy.high,
  //   distanceFilter: 100,
  // );
  // StreamSubscription<Position> positionStream =
  //     Geolocator.getPositionStream(locationSettings: locationSettings)
  //         .listen((Position? position) {
  //   print(position == null
  //       ? 'Unknown'
  //       : '${position.latitude.toString()}, ${position.longitude.toString()}');
  // });

  Future updateMyPosition() async {}
// location.onLocationChanged.listen((LocationData currentLocation) {
// // Use current location
// });
}

// late bool _serviceEnabled;
// PermissionStatus _permissionGranted;
// LocationData _locationData;

// _serviceEnabled = await location.serviceEnabled();
// if (!_serviceEnabled) {
//   _serviceEnabled = await location.requestService();
//   if (!_serviceEnabled) {
//     return;
//   }
// }

// _permissionGranted = await location.hasPermission();
// if (_permissionGranted == PermissionStatus.denied) {
//   _permissionGranted = await location.requestPermission();
//   if (_permissionGranted != PermissionStatus.granted) {
//     return;
//   }
// }

// _locationData = await location.getLocation();
// }

// class TouringEvent {
// String id;
// String tujuan; //harusnya semacam geo location
// String creatorId;
// DateTime durasi;
// DateTime startTime;
// bool isOccuring;

// }

class UserLocation {
  UserLocation(
    this.latitude,
    this.longitude,
    this.accuracy,
    this.altitude,
    this.speed,
    this.speedAccuracy,
    this.heading,
    this.time,
    this.isMock,
  );
  // Latitude, in degrees
  double? latitude;
  // Longitude, in degrees
  double? longitude;
  // Estimated horizontal accuracy of this location, radial, in meters
  double? accuracy;
  // In meters above the WGS 84 reference ellipsoid
  double? altitude;
  // In meters/second
  double? speed;
  // In meters/second, always 0 on iOS
  double? speedAccuracy;
  // Heading is the horizontal direction of travel of this device, in degrees
  double? heading;
  // timestamp of the LocationData
  double? time;
  // Is the location currently mocked
  bool? isMock;
}
