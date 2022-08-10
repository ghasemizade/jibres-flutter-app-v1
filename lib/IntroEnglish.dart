import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/connectivity/errorNoConnecting.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IntroSlideEnglish extends StatefulWidget {
  const IntroSlideEnglish({Key? key}) : super(key: key);

  @override
  IntroSlideEnglishState createState() => IntroSlideEnglishState();
}

class IntroSlideEnglishState extends State<IntroSlideEnglish>
    with TickerProviderStateMixin {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  List<Slide> slides = [];

  @override
  void initState() {
    getConnectivity();
    super.initState();

    slides.add(
      Slide(
        title: "Hello",
        description: "Welcome to the world of Jibbers",
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from == null ? "" : from),
      ),
    );
    slides.add(
      Slide(
        title: "Sell and Enjoy",
        description: "Platform electronic commerce",
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from == null ? "" : from),
      ),
    );
    slides.add(
      Slide(
        title: "Jibres",
        description: "Sometimes you need a big change",
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from == null ? "" : from),
      ),
    );
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
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
              backgroundColor: HexColor(from == null ? "" : from),
              body: SafeArea(
                child: WebView(
                  initialUrl: ('https://jibres.com/my'),
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title_connect_en),
          content: Text(body_connect_en),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, cancel_connect_en);
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: Text(ok_connect_en),
            ),
          ],
        ),
      );
}
