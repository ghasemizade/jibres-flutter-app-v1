import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Intro/IntroEnglish_forJibres.dart';
import 'package:flutter_application_1/Intro/IntroPersian_forJibres.dart';

import 'package:flutter_application_1/splashScreen/splash_V1.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Intro/IntroEnglish_customer.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(Application());
}

class Application extends StatefulWidget {
  Application({
    Key? key,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: splashScreen(),
    );
  }
}
