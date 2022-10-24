import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kawan_touring/models/user_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ObscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ObscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailControl = TextEditingController();
    TextEditingController passControl = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child:
                      //Logo Kawan Touring
                      Image.asset(
                    'assets/logo.png',
                    alignment: Alignment.center,
                  ),
                ),
                //Login with Gmail
                Expanded(
                  flex: 4,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //Gmail field
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(30),
                        //       border: Border.all(width: 1)),
                        //   child: Padding(
                        //     padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        //     child: TextFormField(
                        //       autofocus: true,
                        //       controller: emailControl,
                        //       // key: _formKey,
                        //       decoration: InputDecoration(
                        //         border: UnderlineInputBorder(),
                        //         hintText: 'Gmail',
                        //       ),
                        //       validator: (String? value) =>
                        //           (value == null || value.isEmpty)
                        //               ? "Email must not be empty"
                        //               : null,
                        //     ),
                        //   ),
                        // ),

                        //Password field
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(30),
                        //       border: Border.all(width: 1)),
                        //   child: Padding(
                        //     padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        //     child: TextFormField(
                        //       // key: _formKey,
                        //       autofocus: true,
                        //       controller: passControl,
                        //       decoration: InputDecoration(
                        //         border: UnderlineInputBorder(),
                        //         hintText: 'Password',
                        //       ),
                        //       validator: (String? value) =>
                        //           (value == null || value.isEmpty)
                        //               ? "Password must not be empty"
                        //               : null,
                        //       obscureText: true,
                        //     ),
                        //   ),
                        // ),

                        // Padding(
                        //   padding: EdgeInsets.all(5),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       hintText: 'Password',
                        //     ),
                        //   ),
                        // ),

                        //Login Button
                        // Container(
                        //   padding: EdgeInsets.symmetric(vertical: 15),
                        //   child: ConstrainedBox(
                        //     constraints: BoxConstraints(
                        //       minWidth: 200,
                        //     ),
                        //     child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(),
                        //       onPressed: () {
                        //         //do login logic
                        //         if (_formKey.currentState!.validate()) {}
                        //       },
                        //       child: Text('Login'),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        //   child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Divider(
                        //           height: 2,
                        //         ),
                        //         TextButton(
                        //           onPressed: () {},
                        //           child: Text('Register with Gmail'),
                        //         ),
                        //         Divider(
                        //           height: 2,
                        //         ),
                        //       ]),
                        // ),
                        InkWell(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 18,
                              margin: EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.google),
                                  // Container(
                                  //   height: 30.0,
                                  //   width: 30.0,
                                  //   decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //         image:
                                  //             AssetImage('assets/google.jpg'),
                                  //         fit: BoxFit.cover),
                                  //     shape: BoxShape.circle,
                                  //   ),
                                  // ),
                                  Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ))),
                          onTap: () async {
                            LoginWithGmail();
// hp                      signInWithGoogle(model)
//                           .then((FirebaseUser user){
//                         model.clearAllModels();
//                         Navigator.of(context).pushNamedAndRemoveUntil
//                           (RouteName.Home, (Route<dynamic> route) => false
//                         );}
//                         ).catchError((e) => print(e));
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
