import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:hexcolor/hexcolor.dart';

class splashScreen1 extends StatefulWidget {
  const splashScreen1({Key? key}) : super(key: key);

  @override
  State<splashScreen1> createState() => _splashScreen1State();
}

class _splashScreen1State extends State<splashScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(from1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110.0),
                child: Image(
                  image: AssetImage('Images/logo.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
