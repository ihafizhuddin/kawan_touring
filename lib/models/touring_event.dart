import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kawan_touring/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class TourModel extends ChangeNotifier {
  TouringEvent tour = new TouringEvent();
  List<Map<String, GeoPoint>> userGeoPoint = [];
  List<Marker> userMarker = [];

  //Stream to get current user position periodically
  StreamController<Position> posStreamController = StreamController<Position>();
  late Stream userPosStream;
  late StreamSubscription streamSubscription;

  TourModel() {
    userPosStream = posStreamController.stream;
    // );
  }
  void startSubscribingPosition() async {
    posStreamController.add(await _getGeoLocationPosition());
    streamSubscription = userPosStream.listen((position) async {
      print('Start get position periodically');
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      String? uname = await prefs.getString('user_name');
      Position currentPosition = position;

      GeoPoint geopoint =
          GeoPoint(currentPosition.latitude, currentPosition.longitude);
      await updateGeoPoint(tour.id, uname!, geopoint);
    });
    notifyListeners();
  }

  void stopSubcribingPosition() {
    streamSubscription.cancel();
    // posStreamController.close();
    print('Stop get position periodically');
    notifyListeners();
  }

  // },);
  // Marker myMarker = Marker(infoWindow: 'My Position');
  // String? username = await FirebaseAuth.instance.currentUser!.displayName;

  // void getAndUpdateCurrentUserPosition() {}
  Future setTourDataFromDB(String id) async {
    DocumentSnapshot document = await getTourData(id);
    tour.id = id;
    tour.creatorId = document.get('creator') as String;
    tour.durasi = document.get('durasi') as int;
    tour.isOccuring = document.get('isOccuring') as bool;
    tour.isWaiting = document.get('isWaiting') as bool;
    Timestamp startTime = document.get('start_time') as Timestamp;
    Timestamp endTime = document.get('end_time') as Timestamp;
    tour.startTime = DateTime.parse(startTime.toDate().toString());
    tour.endTime = DateTime.parse(endTime.toDate().toString());
    // tour.endTime = document.get('end_time') as DateTime;
  }

  void setTourId(String id) {
    tour.id = id;
    notifyListeners();
  }

  void setTourCreatorName(String name) {
    tour.creatorId = name;
    print('Penggagas tour : ${tour.creatorId}');
    notifyListeners();
  }

  void setDurasi(int index) {
    switch (index) {
      case 1:
        tour.durasi = 900;
        break;
      case 2:
        tour.durasi = 1800;
        break;
      case 3:
        tour.durasi = 3600;
        break;
      case 4:
        tour.durasi = 10800;
        break;
      default:
        tour.durasi = 0;
    }
    print("durasi tour menjadi ${tour.durasi} detik");
    notifyListeners();
  }

  Future<String> createTourEvent() async {
    tour.id = await CreateTourEvent(tour);
    notifyListeners();
    return tour.id;
  }

  AddUserGeopoint(String uname, GeoPoint coordinate) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String? currentUsername = prefs.getString('user_name');
    userGeoPoint.add({uname: coordinate});
    int markerId = userMarker.length + 1;
    Icon markerIcon = Icon(Icons.navigation);
    if (uname == tour.creatorId) {
    } else if (uname == currentUsername) {}
    userMarker.add(Marker(markerId: MarkerId('${markerId.toString()}')));
    notifyListeners();
  }

  RemoveUserGeoPoint(String uname) {
    // userGeoPoint.re
  }
}

class TouringEvent {
  String id = "";
  // String tujuan; //harusnya semacam geo location
  String creatorId = "";
  int durasi = 0; //dalam detik
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  bool isOccuring = false; //Sedang berlangsung
  bool isWaiting = false; //Akan dimulai

  //menghentikan touring
  void stopTouringEvent() {
    isOccuring = false;
  }

  //memulai touring
  void startTouringEvent() {
    startTime = DateTime.now();
    endTime = startTime.add(Duration(seconds: durasi));
    isOccuring = true;
    isWaiting = false;
  }

  //membuat touring
  createTouringEvents(String id, int durasi) {
    creatorId = id;
    this.durasi = durasi; //dalam detik
    isOccuring = false;
    isWaiting = true;
  }

  set touringId(id) {
    this.id = id;
  }
}

// Stream documentStream =
// FirebaseFirestore.instance.collection("tour_events").doc('').snapshots();

Stream tourEventsStream() {
  return FirebaseFirestore.instance.collection("tour_events").snapshots();
}

Future<String> CreateTourEvent(TouringEvent event) async {
  String newDocId = "";
  List<Map<String, dynamic>> userPosList = [];
  await FirebaseFirestore.instance.collection("tour_events").add(
    {
      // 'tujuan': event.,
      'creator': event.creatorId,
      'durasi': event.durasi, //15 menit
      'start_time': DateTime.now(),
      'end_time': DateTime.now().add(Duration(seconds: event.durasi)),
      'isOccuring': event.isOccuring,
      'isWaiting': event.isWaiting,
      'user_pos': userPosList,
    },
  ).then((doc) {
    newDocId = doc.id;
  });
  return newDocId;
}

Future<DocumentSnapshot> getTourData(String id) {
  // return await
  var document = FirebaseFirestore.instance
      .collection("tour_events")
      .doc(id)
      .get()
      .then((DocumentSnapshot snapshot) {
    return snapshot;
  });
  return document;
}

Future setTourData(String id) async {
  FirebaseFirestore.instance.collection("tour_events").doc(id).set(
    {
      'tujuan': '',
      'creator': 'creatorId',
      'durasi': 900, //15 menit
      'start_time': DateTime.now(),
      'isOccuring': true,
    },
  );
}

Future joinTour(String id) async {
  FirebaseFirestore.instance.collection("tour_events").doc(id).set(
    {
      // 'tujuan': '',
      // 'creator': 'creatorId',
      // 'durasi': 900, //15 menit
      // 'start_time': DateTime.now(),
      // 'isOccuring': true,
    },
  );
}

Future updateGeoPoint(String id, String uname, GeoPoint geopoint) async {
  // List<Map<String, dynamic>> geoPoint

  FirebaseFirestore.instance
      .collection("tour_events")
      .doc(id)
      .update({'user_pos.' + uname: geopoint});
}

Future<Position> _getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
