import 'package:flutter/material.dart';
import 'package:flutter_application_1/Lang.dart';
import 'package:flutter_application_1/languageData/DataLang.dart';
import 'package:flutter_application_1/splash.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({
    Key? key,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();

  static of(BuildContext context) {}
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: splashScreen(),
    );
  }
}
