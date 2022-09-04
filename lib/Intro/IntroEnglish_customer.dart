import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/splashScreen/splash_V1.dart';
import 'package:hexcolor/hexcolor.dart';

class IntroEnglishCustomer extends StatefulWidget {
  const IntroEnglishCustomer({Key? key}) : super(key: key);

  @override
  State<IntroEnglishCustomer> createState() => _IntroEnglishCustomerState();
}

class _IntroEnglishCustomerState extends State<IntroEnglishCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(from1),
      body: SafeArea(
        child: Center(
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    height: 280.0,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120.0,
                          ),
                          Text(
                            title1,
                            style: TextStyle(fontSize: 28.0),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            desc1,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Center(
                    child: SizedBox(
                      height: 450.0,
                      width: 300.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image(
                          image: AssetImage('Images/Jibres-Logo-icon-512.png'),
                          width: 100.0,
                        ),
                        elevation: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
