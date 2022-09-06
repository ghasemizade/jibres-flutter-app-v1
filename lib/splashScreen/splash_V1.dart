import 'dart:async';
import 'dart:convert';
import 'package:after_layout/after_layout.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/languageScreen/DataLang.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../languageScreen/langPage.dart';

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
  splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with AfterLayoutMixin<splashScreen> {
  Future checkFirstSeen() async {
    await Future.delayed(Duration(
      milliseconds: sleep == null ? sleep1 : sleep,
    ));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? true);

    if (_seen) {
      if (isDeviceConnected == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return langPage();
          }),
        );
      } else if (isDeviceConnected == false) {
        showDialogBox(context);
      }
      _seen = await prefs.setBool('seen', false);
    } else if (isDeviceConnected == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return homePage();
        }),
      );
    } else if (isDeviceConnected == false) {
      showDialogBox(context);
    }
  }

  //with TickerProviderStateMixin,
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  initState() {
    _getDataSplash();
    super.initState();
    //_handleSplash();
    checkFirstSeen();
    getConnectivity();
    saveData();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox(context);
          } else if (!isDeviceConnected == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return splashScreen();
                },
              ),
            );
          }
        },
      );

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      stashLang = prefs.getString('stashLang')!;
    });
  }

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
              RippleAnimation(
                repeat: true,
                color: Color.fromARGB(255, 250, 30, 102),
                minRadius: 80,
                ripplesCount: 8,
                // duration: Duration(milliseconds: 10000),
                child: Container(
                  child: Image(
                    image: AssetImage(logo1),
                    height: 200.0,
                  ),
                  // child: logo == null
                  //     ? Image(
                  //         image: AssetImage(logo1),
                  //         height: 200.0,
                  //       )
                  //     : Image(
                  //         image: NetworkImage(logo),
                  //         height: 200.0,
                  //       ),
                ),
              ),
              // dotenv.env['title1'] ?? 'title not found',
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stashLang == urlhomeen ? title2 : title1,
                    style: TextStyle(
                      fontSize: 28,
                      color: HexColor(
                        primary == null ? primary1 : primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    stashLang == urlhomeen ? desc2 : desc1,
                    style: TextStyle(
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
              Text(
                stashLang == urlhomeen ? meta2 : meta1,
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor(
                    primary == null ? primary1 : primary,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  showDialogBox(context) {
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      barrierColor: Color.fromARGB(170, 0, 0, 0),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 238, 234),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage('Images/ConnectionLost.png'),
                height: 250,
              ),
              Text(
                stashLang == urlhomeen
                    ? 'No internet connections!'
                    : '!اتصال به انترنت برقرار نیست',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                stashLang == urlhomeen
                    ? 'Please try again later'
                    : 'لطفا بعدا دوباره امتحان کنید',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 250.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (isDeviceConnected == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return homePage();
                        }),
                      );
                    } else if (isDeviceConnected == false) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Application();
                          },
                        ),
                      );
                    }
                  },
                  child: Text(
                    stashLang == urlhomeen ? 'try again' : 'دوباره امتحان کنید',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 200, 10, 90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // showDisconnectInternet(){
  //   return Expanded(
  //     child: Container(
  //       decoration: ,
  //     ),
  //   );
  // }

  Future<void> _getDataSplash() async {
    var urI = Uri.parse(ApiUrl);
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

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    throw UnimplementedError();
  }
}
