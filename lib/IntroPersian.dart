import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'data/modle/introJson.dart';

class IntroSlide extends StatefulWidget {
  const IntroSlide({Key? key}) : super(key: key);

  @override
  IntroSlideState createState() => IntroSlideState();
}

class IntroSlideState extends State<IntroSlide> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: title_fa,
        description: desc_fa,
        pathImage: logo,
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
    slides.add(
      Slide(
        title: title_fa_1,
        description: desc_fa_1,
        pathImage: logo,
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
    slides.add(
      Slide(
        title: title == null ? from1 : title,
        description: desc_fa_2,
        pathImage: logo,
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
                  initialUrl: (urlfa),
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
