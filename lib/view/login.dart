import 'package:flutter/material.dart';

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
                  flex: 7,
                  child:
                      //Logo Kawan Touring
                      Image.asset(
                    'assets/logo.png',
                    alignment: Alignment.center,
                  ),
                ),
                //Login with Gmail
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      //Gmail field
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 1)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Gmail',
                            ),
                          ),
                        ),
                      ),
                      //Password field
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 1)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Password',
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),

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
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Login'),
                      ),
                    ],
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
