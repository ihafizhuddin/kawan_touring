import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kawan_touring/models/location_model.dart';
import 'package:kawan_touring/models/touring_event.dart';
import 'package:kawan_touring/models/user_model.dart';
import 'package:kawan_touring/view/create_tour.dart';
import 'package:kawan_touring/view/join_tour.dart';
import 'package:kawan_touring/view/login.dart';
import 'package:kawan_touring/view/main_menu.dart';
import 'package:kawan_touring/view/share_tour.dart';
import 'package:kawan_touring/view/touring.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocationService>(create: (_) => LocationService()),
        Provider<TourModel>(
          create: (context) => TourModel(),
        ),
        Provider<UserModel>(
          create: (context) => UserModel(),
        ),
        //   Provider<SomethingElse>(create: (_) => SomethingElse()),
        //   Provider<AnotherThing>(create: (_) => AnotherThing()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthGate(),
        routes: {
          '/main_menu': (context) => const MainMenu(),
          '/create_tour': (context) => const CreateTour(),
          '/share_tour': (context) => const ShareTourInfo(),
          '/scan_tour': (context) => const ScanTourQR(),
          '/join_tour': (context) => const PengikutTouring(),
          '/tour_info': (context) => const JoinTourInfo(),
          '/finish_tour': (context) => const JoinTourInfo(),
          '/tour': (context) => const Touring(),
        },
        // home: MainMenu(),
      ),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Login();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return MainMenu();
      },
    );
  }
}
