import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/langPage.dart';

import 'package:flutter_application_1/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'connectivity/errorNoConnecting.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(Application());
}

class Application extends StatefulWidget {
  Application({
    Key? key,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
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
  void initState() {
    getConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: splashScreen(),
    );
  }
}
