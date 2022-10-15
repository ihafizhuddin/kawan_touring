import 'package:flutter/material.dart';
import 'package:kawan_touring/view/GoogleMaps/maps_dummy.dart';

class Touring extends StatefulWidget {
  const Touring({Key? key}) : super(key: key);

  @override
  State<Touring> createState() => _TouringState();
}

class _TouringState extends State<Touring> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Touring'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey.shade500,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                // color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          child: Text('Leave Tour'),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
