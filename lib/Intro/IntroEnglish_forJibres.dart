import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/introJson.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';

import 'package:flutter_application_1/splashScreen/splash_V1.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
        title: dotenv.env['title_en'] ?? 'not found title 1',
        description: dotenv.env['desc_en'] ?? 'not fount description 1',
        pathImage: dotenv.env['logo1'] ?? 'not fount logo',
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
    slides.add(
      Slide(
        title: dotenv.env['title_en_1'] ?? 'not found title 2',
        description: dotenv.env['desc_en_1'] ?? 'not found description 2',
        pathImage: dotenv.env['logo1'] ?? 'not found logo',
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
    slides.add(
      Slide(
        title: dotenv.env['title_en_2'] ?? 'not found title 3',
        description: dotenv.env['desc_en_2'] ?? 'not found description 3',
        pathImage: dotenv.env['logo1'] ?? 'not found logo',
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
