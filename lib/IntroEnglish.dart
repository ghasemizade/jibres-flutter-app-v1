import 'package:flutter/material.dart';
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
        title: "Hello",
        description: "Welcome to the world of Jibbers",
        pathImage: "Images/logo.png",
        backgroundColor: const Color.fromARGB(255, 200, 10, 90),
      ),
    );
    slides.add(
      Slide(
        title: "Sell and Enjoy",
        description: "Platform electronic commerce",
        pathImage: "Images/logo.png",
        backgroundColor: const Color.fromARGB(255, 200, 10, 90),
      ),
    );
    slides.add(
      Slide(
        title: "Jibres",
        description: "Sometimes you need a big change",
        pathImage: "Images/logo.png",
        backgroundColor: const Color.fromARGB(255, 200, 10, 90),
      ),
    );
  }

  // void onDonePress() {
  //   // Do what you want
  //   log("End of slides");
  // }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 200, 10, 90),
              body: SafeArea(
                child: WebView(
                  initialUrl: ('https://jibres.ir/my'),
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
