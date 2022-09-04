import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Intro/IntroEnglish_forJibres.dart';
import 'package:flutter_application_1/Intro/IntroPersian_forJibres.dart';
import 'package:flutter_application_1/languageData/DataLang.dart';
import 'package:flutter_application_1/splashScreen/splash_V1.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../connectivity/errorNoConnecting.dart';
import '../data/modle/splashJson.dart';

class langPage extends StatefulWidget {
  const langPage({Key? key}) : super(key: key);

  @override
  State<langPage> createState() => _langPageState();
}

class _langPageState extends State<langPage> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(from == null ? from1 : from),
      body: SafeArea(
        child: WebView(
          initialUrl: urllang,
          javascriptMode: JavascriptMode.unrestricted,
          zoomEnabled: false,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('jibres://language')) {
              if (request.url.startsWith('jibres://language/fa')) {
                dynamic stashLang = urlhomefa;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => IntroSlide(),
                  ),
                );
                print(stashLang);
                return NavigationDecision.prevent;
              } else if (request.url.startsWith('jibres://language/en')) {
                dynamic stashLang = urlhomeen;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => IntroSlideEnglish(),
                  ),
                );
                print(stashLang);
                return NavigationDecision.prevent;
              }
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }

  dynamic temp = stashLang;
}
