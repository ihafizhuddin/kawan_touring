import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateTour extends StatelessWidget {
  const CreateTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Start your tour'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Choose your destination'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search destination location'),
              ),
            ),
            Expanded(
              child: Card(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    // width: MediaQuery.of(context).size.width / 2,
                    // height: MediaQuery.of(context).size.width / 2,
                    // decoration: BoxDecoration(
                    //   color: Colors.grey,
                    //   shape: BoxShape.circle,
                    // ),
                    child: Stack(
                      children: [
                        StartTourMap(),
                        Positioned(
                          child: Text(
                            'Choose Target Location',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('15 Minutes'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('1 hour'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('3 hour'),
                  ),
                  // IconButton(
                  //   icon: Icon(FontAwesomeIcons.whatsapp),
                  //   onPressed: () {},
                  // ),
                  // IconButton(
                  //   icon: Icon(FontAwesomeIcons.line),
                  //   onPressed: () {},
                  // ),
                  // IconButton(
                  //   icon: Icon(FontAwesomeIcons.telegram),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                child: Text('Create Tour'),
                onPressed: () {
                  Navigator.pushNamed(context, '/share_tour');
                },
              ),
            ),
          ],
        ));
  }
}
//Create a tour by choosing destination

//Share link

class StartTourMap extends StatefulWidget {
  const StartTourMap({Key? key}) : super(key: key);

  @override
  State<StartTourMap> createState() => _StartTourMapState();
}

class _StartTourMapState extends State<StartTourMap> {
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
