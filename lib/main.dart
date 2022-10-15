import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kawan_touring/view/create_tour.dart';
import 'package:kawan_touring/view/join_tour.dart';
import 'package:kawan_touring/view/login.dart';
import 'package:kawan_touring/view/main_menu.dart';
import 'package:kawan_touring/view/share_tour.dart';
import 'package:kawan_touring/view/touring.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
      routes: {
        // '/main_menu': (context) => const MainMenu(),
        '/create_tour': (context) => const CreateTour(),
        '/share_tour': (context) => const ShareTourInfo(),
        '/scan_tour': (context) => const ScanTourQR(),
        '/join_tour': (context) => const PengikutTouring(),
        '/tour_info': (context) => const JoinTourInfo(),
        '/finish_tour': (context) => const JoinTourInfo(),
        '/tour': (context) => const Touring(),
      },
      // home: MainMenu(),
    );
  }
}
