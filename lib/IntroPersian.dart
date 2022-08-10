import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/connectivity/errorNoConnecting.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'data/modle/introJson.dart';

class IntroSlide extends StatefulWidget {
  const IntroSlide({Key? key}) : super(key: key);

  @override
  IntroSlideState createState() => IntroSlideState();
}

class IntroSlideState extends State<IntroSlide> with TickerProviderStateMixin {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  List<Slide> slides = [];

  @override
  void initState() {
    getConnectivity_fa();
    super.initState();

    slides.add(
      Slide(
        title: title1,
        description: desc1,
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from == null ? "" : from),
      ),
    );
    slides.add(
      Slide(
        title: 'subtitle2',
        description: 'desc2',
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from == null ? "" : from),
      ),
    );
    slides.add(
      Slide(
        title: title == null ? "" : title,
        description: 'subtitle5',
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from == null ? "" : from),
      ),
    );
  }

  getConnectivity_fa() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox_fa();
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

  showDialogBox_fa() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title_connect_fa),
          content: Text(body_connect_fa),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, cancel_connect_fa);
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox_fa();
                  setState(() => isAlertSet = true);
                }
              },
              child: Text(ok_connect_fa),
            ),
          ],
        ),
      );
}
