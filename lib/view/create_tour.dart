import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kawan_touring/models/touring_event.dart';
import 'package:kawan_touring/models/user_model.dart';
import 'package:kawan_touring/view/GoogleMaps/maps_dummy.dart';
import 'package:provider/provider.dart';

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
                        DemoMap(),
                        // StartTourMap(),
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
              child: DurasiButton(),
              //  Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: Text('15 Minutes'),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: Text('1 hour'),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: Text('3 hour'),
              //     ),
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
              //   ],
              // ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                child: Text('Create Tour'),
                onPressed: () async {
                  String username =
                      Provider.of<UserModel>(context, listen: false).username;
                  Provider.of<TourModel>(context, listen: false)
                      .setTourCreatorName(username);
                  await Provider.of<TourModel>(context, listen: false)
                      .createTourEvent();

                  Navigator.pushNamed(context, '/share_tour');
                },
              ),
            ),
          ],
        ));
  }
}

class DurasiButton extends StatefulWidget {
  const DurasiButton({Key? key}) : super(key: key);

  @override
  State<DurasiButton> createState() => _DurasiButtonState();
}

class _DurasiButtonState extends State<DurasiButton> {
  final List<bool> durationList = <bool>[true, false, false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TourModel>(context, listen: false).setDurasi(1);
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red,
      selectedColor: Colors.white,
      fillColor: Colors.blue,
      isSelected: durationList,
      direction: Axis.horizontal,
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < durationList.length; i++) {
            durationList[i] = i == index;
          }
          Provider.of<TourModel>(context, listen: false).setDurasi(index + 1);
        });
      },
      children: [
        Text('15 menit'),
        Text('30 menit'),
        Text('1 jam'),
        Text('3 jam'),
      ],
    );
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
  final LatLng _center = LatLng(-7.9, 112.6);

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
