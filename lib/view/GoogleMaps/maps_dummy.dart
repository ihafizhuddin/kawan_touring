// import 'dart:html';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kawan_touring/models/touring_event.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class DemoMap extends StatefulWidget {
  const DemoMap({Key? key}) : super(key: key);

  @override
  State<DemoMap> createState() => _DemoState();
}

class _DemoState extends State<DemoMap> {
  late GoogleMapController mapController;
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  LatLng _center = LatLng(45, -122);

  Location currentLocation = new Location();

  Completer<GoogleMapController> _controller = Completer();

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(-7.9, 112.6),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  // Method for retrieving the current location
// For storing the current position
  late Position _currentPosition;

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      // await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // created method for getting user current location
  // Future<Position> getUserCurrentLocation() async {
  //   await Geolocator.requestPermission()
  //       .then((value) {})
  //       .onError((error, stackTrace) async {
  //     await Geolocator.requestPermission();
  //     print("ERROR" + error.toString());
  //   });
  //   return await Geolocator.getCurrentPosition();
  // }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    // Position userPos = await getUserCurrentLocation();
    // _center = LatLng(userPos.latitude, userPos.longitude);
  }

  @override
  Widget build(BuildContext context) {
    String id = Provider.of<TourModel>(context, listen: false).tour.id;
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      // markers: GenerateMapMark(markList),
    );
    // StreamBuilder(
    //     stream: getTourData(id),
    //     builder: ((context, snapshot) {
    //       return GoogleMap(
    //         onMapCreated: _onMapCreated,
    //         initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
    //         myLocationButtonEnabled: true,
    //         myLocationEnabled: true,
    //         mapType: MapType.normal,
    //         zoomGesturesEnabled: true,
    //         zoomControlsEnabled: false,
    //         markers: GenerateMapMark(markList),
    //       );
    //     }));
  }
// }

// SetCurrentLocation() {}
  Set<Marker> GenerateMapMark(Map<String, dynamic> markList) {
    Set<Marker> markerList = Set();
    int index = 0;
    // String creatorName = Provider.of<>(context, listen: false).;

    // for (Map<String, GeoPoint> mark in markList) {
    // Geopoint geoPos = mark.values;
    // String uname =
    // markerList.add()
    // }
    for (var entry in markList.entries) {
      String uname = entry.key;
      GeoPoint point = entry.value;

      int markId = index++;
      Marker newMarker = Marker(
          markerId: MarkerId('${markId.toString()}'),
          position: LatLng(point.latitude, point.longitude),
          infoWindow: InfoWindow(title: uname));
      markerList.add(newMarker);
    }
    return markerList;
  }
}

class StreamMapDemo extends StatefulWidget {
  const StreamMapDemo({Key? key}) : super(key: key);

  @override
  State<StreamMapDemo> createState() => _StreamMapDemoState();
}

class _StreamMapDemoState extends State<StreamMapDemo> {
  late GoogleMapController mapController;
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  LatLng _center = LatLng(45, -122);

  Location currentLocation = new Location();

  Completer<GoogleMapController> _controller = Completer();

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(-7.9, 112.6),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  // Method for retrieving the current location
// For storing the current position
  late Position _currentPosition;

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      // await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // created method for getting user current location
  // Future<Position> getUserCurrentLocation() async {
  //   await Geolocator.requestPermission()
  //       .then((value) {})
  //       .onError((error, stackTrace) async {
  //     await Geolocator.requestPermission();
  //     print("ERROR" + error.toString());
  //   });
  //   return await Geolocator.getCurrentPosition();
  // }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    // Position userPos = await getUserCurrentLocation();
    // _center = LatLng(userPos.latitude, userPos.longitude);
  }

  @override
  Widget build(BuildContext context) {
    String tourId = Provider.of<TourModel>(context, listen: false).tour.id;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(tourId)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading");
          }
          var userDocument = snapshot.data;
          // List<Map<String, dynamic>> markeDataList = userDocument.data().;
          // generate
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            // markers: GenerateMapMark(markList),
          );
        });
  }

  Set<Marker> GenerateMapMark(Map<String, dynamic> markList) {
    Set<Marker> markerList = Set();
    int index = 0;
    // String creatorName = Provider.of<>(context, listen: false).;

    // for (Map<String, GeoPoint> mark in markList) {
    // Geopoint geoPos = mark.values;
    // String uname =
    // markerList.add()
    // }
    for (var entry in markList.entries) {
      String uname = entry.key;
      GeoPoint point = entry.value;

      int markId = index++;
      Marker newMarker = Marker(
          markerId: MarkerId('${markId.toString()}'),
          position: LatLng(point.latitude, point.longitude),
          infoWindow: InfoWindow(title: uname));
      markerList.add(newMarker);
    }
    return markerList;
  }
}
