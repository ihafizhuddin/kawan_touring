import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DemoMap extends StatefulWidget {
  const DemoMap({Key? key}) : super(key: key);

  @override
  State<DemoMap> createState() => _DemoState();
}

class _DemoState extends State<DemoMap> {
  late GoogleMapController mapController;
  final LatLng _center = LatLng(45, -122);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
    );
  }
}
