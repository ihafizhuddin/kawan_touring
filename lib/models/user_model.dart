import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class User {
//   User();
// }

class UserModel extends ChangeNotifier {
  // User _user;
  late String id = "";
  late String email = "";
  late String username = "";
  void setUserDataWhenLogout() async {
    this.id = "";
    this.email = "";
    this.username = "";
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', this.id);
    await prefs.setString('user_email', this.email);
    await prefs.setString('user_name', this.username);
    notifyListeners();
  }

  void setUserDataWhenLogin(String id, String email, String username) async {
    final prefs = await SharedPreferences.getInstance();
    this.id = id;
    this.email = email;
    this.username = username;
    await prefs.setString('user_id', this.id);
    await prefs.setString('user_email', this.email);
    await prefs.setString('user_name', this.username);
    print('Set user data');

    notifyListeners();
  }

  set uName(String uname) {
    int index = uname.indexOf('@');
    if (index == -1) return;
    email = uname.substring(0, uname.indexOf('@)'));
  }
  //profil pictures
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

Future checkUserState() async {
  // FirebaseAuth.instance.authStateChanges().listen((User? user) async {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User is signed in!');
  //   }
  // });
}
Future LoginWithGmail() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future Logout() async {
  await FirebaseAuth.instance.signOut();
}
