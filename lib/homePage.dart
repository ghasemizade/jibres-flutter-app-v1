import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/splashScreen/splash_V1.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'connectivity/errorNoConnecting.dart';
import 'data/modle/splashJson.dart';
import 'languageScreen/DataLang.dart';
import 'languageScreen/langPage.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

dynamic urllang;
dynamic url_fa = 'jibres://language/fa';
dynamic url_en = 'jibres://language/en';

class _homePageState extends State<homePage> {
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
                  setState(() => isAlertSet = true);
                }
              },
              child: Text(ok_connect_en),
            ),
          ],
        ),
      );
  String urlHome = ('https://jibres.ir/enter?referer=my');
  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      stashLang = prefs.getString('stashLang')!;
    });
  }

  @override
  void initState() {
    saveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(from == null ? from1 : from),
      body: SafeArea(
        child: navigateToHomepage(),
      ),
    );
  }

  navigateToHomepage() {
    if (stashLang == urlhomefa) {
      return WebView(
        initialUrl: (urlhomefa),
        javascriptMode: JavascriptMode.unrestricted,
        zoomEnabled: false,
        onProgress: (isDeviceConnected) {
          if (isDeviceConnected == false) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return splashScreen();
                },
              ),
            );
          }
        },
      );
    } else if (stashLang == urlhomeen) {
      return WebView(
        initialUrl: (urlhomeen),
        javascriptMode: JavascriptMode.unrestricted,
        zoomEnabled: false,
        onProgress: (isDeviceConnected) {
          if (isDeviceConnected == false) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return splashScreen();
                },
              ),
            );
          }
        },
      );
    }
  }
}
