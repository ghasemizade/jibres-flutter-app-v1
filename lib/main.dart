import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Intro/IntroPersian_customer.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/splashScreen/splash_V1.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Intro/IntroPersian_forJibres.dart';
import 'data/modle/introData.dart';

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
