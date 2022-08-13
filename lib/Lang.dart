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
  static const String id = "/Language";
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> with AfterLayoutMixin<Language> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? true);
    //final prefs = await SharedPreferences.getInstance();

    if (_seen) {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Language(),
          );
        }),
      );
    } else {
      await prefs.setBool('seen', false);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) {
          return WebView(
            initialUrl: ('https://jibres.ir/my'),
            javascriptMode: JavascriptMode.unrestricted,
          );
        }),
      );
    }
  }

  //final String? language = prefs.getString('lang');
  // if (language == null) {
  //   prefs.setString('lang', choosePersian);
  // } else {
  //   prefs.setString('lang', chooseEnglish);
  // }

// final String? language = prefs.getString('lang');
// if(language == null){
//     prefs.setString('lang', 'eng');
//     language = 'eng';
// }

  @override
  void initState() {
    //checkFirstSeen();
    super.initState();
  }

//   final prefs = await SharedPreferences.getInstance();
// final String? language = prefs.getString('lang');
// if(language == null){
//     prefs.setString(choosePersian, chooseEnglish);
//     language = choosePersian;
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
  FutureOr<void> afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    throw UnimplementedError();
  }

  // @override
  // void afterFirstLayout(BuildContext context) {
  //   return checkFirstSeen();
  // }
}
