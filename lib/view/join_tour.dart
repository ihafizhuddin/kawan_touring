import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kawan_touring/models/touring_event.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

//Join tour by scanning
class ScanTourQR extends StatelessWidget {
  const ScanTourQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Tour'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Scan Tour QR to join'),
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.lightBlueAccent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: QRScanner(),

              //   Container(
              //       padding: EdgeInsets.all(5),
              //       color: Colors.red,
              //       child: Center(
              //         child: Text('QR Scanner'),
              //       )
              //       // width: 300,
              //       // height: 300,
              //       ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(15),
        child: ElevatedButton(
          child: Text('if_succes go to tour info'),
          onPressed: () {
            Navigator.pushNamed(context, '/tour_info');
          },
        ),
      ),
    );
  }
}

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  Barcode? result;
  String qrValue = '';
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      // setState(() => result = scanData);
      setState(() async {
        result = scanData;
        qrValue = scanData.code!;
        // String tourIdget = result.toString();
        print('id tour : $qrValue');
        await Provider.of<TourModel>(context, listen: false)
            .setTourDataFromDB(qrValue);
        nextPageRoute();
      });
    });
  }

  nextPageRoute() async {
    controller?.pauseCamera();

    var value = await Navigator.pushNamed(context, '/tour_info');
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (result != null) {
      controller!.pauseCamera();
      print(result!.code);

      controller!.dispose();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.orange,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 250,
      ),
    );
  }
}

//Join tour by clicking link
class JoinTourInfo extends StatelessWidget {
  const JoinTourInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Tour'),
      ),
      body: Center(
        child: Container(
          child: Card(
              // constraints: BoxConstraints(),
              child: Consumer<TourModel>(
            builder: (context, TourModel tourModel, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('Link'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('Pemimpin Tour : ${tourModel.tour.creatorId}'),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(5),
                  //   child: Text('Tujuan : Brawijaya'),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      child: Text('Join Tour'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/join_tour');
                      },
                    ),
                  ),
                ],
              );
            },
          )),
        ),
      ),
    );
  }
}
