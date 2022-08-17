import 'package:flutter/material.dart';
import 'package:flutter_application_1/IntroEnglish.dart';
import 'package:flutter_application_1/IntroPersian.dart';
import 'package:flutter_application_1/languageData/DataLang.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'data/modle/splashJson.dart';

class langPage extends StatefulWidget {
  const langPage({Key? key}) : super(key: key);

  @override
  State<langPage> createState() => _langPageState();
}

class _langPageState extends State<langPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(from == null ? from1 : from),
      body: SafeArea(
        child: WebView(
            initialUrl: urllang,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (urllang) {
              if (urllang == langfa) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => IntroSlide(),
                  ),
                );
              } else if (urllang == langen) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => IntroSlideEnglish(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
