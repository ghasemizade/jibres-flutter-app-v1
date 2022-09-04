import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/splashScreen/splash_V1.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../data/modle/introJson.dart';

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
        title: dotenv.env['title_fa'] ?? '!تیتر پیدا نشد',
        description: dotenv.env['desc_fa'] ?? '!توضیح یافت نشد',
        pathImage: dotenv.env['logo1'] ?? 'عکس یافت نشد',
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
    slides.add(
      Slide(
        title: dotenv.env['title_fa_1'] ?? '!تیتر پیدا نشد',
        description: dotenv.env['desc_fa_1'] ?? '!توضیح یافت نشد',
        pathImage: dotenv.env['logo1'] ?? 'عکس یافت نشد',
        backgroundColor: HexColor(from == null ? from1 : from),
      ),
    );
    slides.add(
      Slide(
        title: dotenv.env['title1'] ?? '!تیتر یافت نشد',
        description: dotenv.env['desc_fa_2'] ?? 'توضیح یافت نشد',
        pathImage: dotenv.env['logo1'] ?? 'عکس یافت نشد',
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
