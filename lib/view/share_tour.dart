import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareTourInfo extends StatelessWidget {
  const ShareTourInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qrKey = GlobalKey();
    String qrData = 'QRData';
    return Scaffold(
      appBar: AppBar(
        title: Text('Share tour'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //QRCode
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  // shape: BoxShape.circle,
                ),
                child: Center(
                    child: RepaintBoundary(
                  key: qrKey,
                  child: QrImage(
                    data: qrData,
                    //  embeddedImage: , You can add your custom image to the center of your QR
                    //  semanticsLabel:'', You can add some info to display when your QR scanne
                    size: 250,
                    backgroundColor: Colors.white,
                    version: QrVersions.auto,
                  ),
                )
                    // Text(
                    //   'QRCode',
                    //   textAlign: TextAlign.center,
                    // ),
                    ),
              ),
            ),
          ),
          //link tour
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'current tour link'),
            ),
          ),
          //share link button
          Container(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Share Link',
              ),
            ),
          ),

          //info text
          Container(
            padding: EdgeInsets.all(15),
            child: Text('to let your friend join the tour'),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.whatsapp),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.line),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.telegram),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          //ready? button
          Container(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              child: Text(
                'Ready?',
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/tour');
              },
            ),
          ),
        ],
      ),
    );
  }
}
