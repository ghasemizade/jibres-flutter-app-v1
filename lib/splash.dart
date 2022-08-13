import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Lang.dart';
import 'package:flutter_application_1/connectivity/errorNoConnecting.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/languageData/DataLang.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

dynamic logo;
dynamic theme;
dynamic title;
dynamic desc;
dynamic meta;
dynamic sleep;
dynamic from;
dynamic to;
dynamic primary;
dynamic secondary;

class splashScreen extends StatefulWidget {
  static const String id = "/Language";
  splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    _getDataSplash();
    getConnectivity();
    super.initState();
    _handleSplash();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HexColor(from == null ? from1 : from),
              HexColor(to == null ? to1 : to),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: logo == null
                    ? Image(
                        image: AssetImage(logo1),
                      )
                    : Image(
                        image: NetworkImage(logo),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title == null ? title1 : title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 28,
                      color: HexColor(
                        primary == null ? primary1 : primary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    desc == null ? desc1 : desc,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: HexColor(
                        primary == null ? primary1 : primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150.0,
              ),
              SpinKitRipple(
                color: Colors.white54,
                size: 60.0,
              ),
              Text(
                meta == null ? meta1 : meta,
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor(
                    primary == null ? primary1 : primary,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
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

  void _handleSplash() async {
    await Future.delayed(Duration(
      milliseconds: sleep == null ? sleep1 : sleep,
    ));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return Scaffold(
          body: Language(),
        );
      }),
    );
  }

  Future<void> _getDataSplash() async {
    var urI = Uri.parse('https://core.jibres.ir/r10/android/splash');
    Response response = await get(urI);

    setState(() {
      logo = jsonDecode(response.body)["result"]["logo"];
      theme = jsonDecode(response.body)["result"]["theme"];
      title = jsonDecode(response.body)["result"]["title"];
      desc = jsonDecode(response.body)["result"]["desc"];
      meta = jsonDecode(response.body)["result"]["meta"];
      sleep = jsonDecode(response.body)["result"]["sleep"];
      from = jsonDecode(response.body)["result"]["bg"]["from"];
      to = jsonDecode(response.body)["result"]["bg"]["to"];
      primary = jsonDecode(response.body)["result"]["color"]["primary"];
      secondary = jsonDecode(response.body)["result"]["color"]["secondary"];
    });
  }
}
