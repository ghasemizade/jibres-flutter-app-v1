import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/IntroEnglish.dart';
import 'package:flutter_application_1/IntroPersian.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/languageData/DataLang.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> with AfterLayoutMixin<Language> {
  void checkFirstSeen() async {
    SharedPreferences persian = await SharedPreferences.getInstance();
    bool _choose = (persian.getBool('choose') ?? true);

    if (_choose) {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) {
          return Scaffold(
            backgroundColor: HexColor(from == null ? from1 : from),
            body: SafeArea(
              child: WebView(
                initialUrl: ('https://jibres.ir/my'),
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          );
        }),
      );
    } else {
      await persian.setBool('choose', false);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) {
          return Scaffold(
            backgroundColor: HexColor(from == null ? from1 : from),
            body: SafeArea(
              child: WebView(
                initialUrl: ('https://jibres.com/my'),
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          );
        }),
      );
    }
  }

  // @override
  // void initState() {
  //   checkFirstSeen();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 231, 224),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              choose,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              yourLang,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _handlePersian();
                  },
                  child: Container(
                    width: 170.0,
                    height: 145.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      choosePersian,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _handleEnglish();
                  },
                  child: Container(
                    width: 170.0,
                    height: 145.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      chooseEnglish,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handlePersian() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Scaffold(
          backgroundColor: HexColor(from == null ? from1 : from),
          body: SafeArea(
            child: IntroSlide(),
          ),
        );
      }),
    );
  }

  void _handleEnglish() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) {
          return Scaffold(
            backgroundColor: HexColor(from == null ? from1 : from),
            body: SafeArea(
              child: IntroSlideEnglish(),
            ),
          );
        }),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    return checkFirstSeen();
  }
}
