import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kawan_touring/models/touring_event.dart';
import 'package:kawan_touring/view/GoogleMaps/maps_dummy.dart';
import 'package:provider/provider.dart';

class Touring extends StatefulWidget {
  const Touring({Key? key}) : super(key: key);

  @override
  State<Touring> createState() => _TouringState();
}

class _TouringState extends State<Touring> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('trying to listen position');
    Provider.of<TourModel>(context, listen: false).startSubscribingPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Touring'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              // child:
              child: DemoMap(),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          child: Text('Stop Tour'),
          onPressed: () {
            print('trying to stop listen position');
            Provider.of<TourModel>(context, listen: false)
                .stopSubcribingPosition();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class PengikutTouring extends StatefulWidget {
  const PengikutTouring({Key? key}) : super(key: key);

  @override
  State<PengikutTouring> createState() => _PengikutTouringState();
}

class _PengikutTouringState extends State<PengikutTouring> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TourModel>(context, listen: false).startSubscribingPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Touring'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              // child:
              child: DemoMap(),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          child: Text('Leave Tour'),
          onPressed: () {
            Provider.of<TourModel>(context, listen: false)
                .stopSubcribingPosition();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
