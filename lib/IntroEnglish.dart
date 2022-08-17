import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/introJson.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';

import 'package:flutter_application_1/splash.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:intro_slider/intro_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IntroSlideEnglish extends StatefulWidget {
  const IntroSlideEnglish({Key? key}) : super(key: key);

  @override
  IntroSlideEnglishState createState() => IntroSlideEnglishState();
}

class IntroSlideEnglishState extends State<IntroSlideEnglish> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: title_en,
        description: desc_en,
        pathImage: logo1,
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
    slides.add(
      Slide(
        title: title_en_1,
        description: desc_en_1,
        pathImage: logo1,
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
    slides.add(
      Slide(
        title: title_en_2,
        description: desc_en_2,
        pathImage: logo1,
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return Scaffold(
              backgroundColor: HexColor(from == null ? from1 : from),
              body: SafeArea(
                child: WebView(
                  initialUrl: (urlen),
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
