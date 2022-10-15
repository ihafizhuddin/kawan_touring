import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  //Button Create a Tour
                  ElevatedButton(
                    child: Text('Create a Tour'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/create_tour');
                    },
                  ),
                  //
                  // Flex(),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                        ),
                        Text(
                          'or',
                          style: TextStyle(fontSize: 16),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Join a Tour Text Button
                  ElevatedButton(
                    child: Text('Join a Tour'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/scan_tour');
                    },
                  ),
                ],
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
