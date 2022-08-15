import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/IntroEnglish.dart';
import 'package:flutter_application_1/IntroPersian.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/languageData/DataLang.dart';
import 'package:flutter_application_1/main.dart';
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

String chooselang = '';
bool isPersian = true;

class _LanguageState extends State<Language> {
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

  void onPressed(String id) {
    print('pressed $id');
  }

  final btnfa = ButtonActivateIntent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 231, 224),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 130.0,
            ),
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
            Expanded(
              child: GridView.builder(
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 249, 231, 224),
                          width: 18,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          ChooseLang[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: ChooseLang[index] == choosePersian
                                ? Colors.orange
                                : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void tapped(int index) {
    print('$index');

    setState(() {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            backgroundColor: HexColor(from == null ? from1 : from),
            body: SafeArea(
              child: ChooseLang[index] == choosePersian
                  ? IntroSlide()
                  : IntroSlideEnglish(),
            ),
          );
        },
      ));
    });
    // setState(() {
    //   if (ChooseLang[index] == true) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) {
    //         return Scaffold(
    //           backgroundColor: HexColor(from == null ? from1 : from),
    //           body: SafeArea(
    //             child: IntroSlide(),
    //           ),
    //         );
    //       }),
    //     );
    //   } else {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: ((context) {
    //           return Scaffold(
    //             backgroundColor: HexColor(from == null ? from1 : from),
    //             body: SafeArea(
    //               child: IntroSlideEnglish(),
    //             ),
    //           );
    //         }),
    //       ),
    //     );
    //   }
    // });
  }

  // void _handlePersian() {
  //   chooselang = 'fa';
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) {
  //       return Scaffold(
  //         backgroundColor: HexColor(from == null ? from1 : from),
  //         body: SafeArea(
  //           child: IntroSlide(),
  //         ),
  //       );
  //     }),
  //   );
  // }

  // void _handleEnglish() {
  //   chooselang = 'en';
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: ((context) {
  //         return Scaffold(
  //           backgroundColor: HexColor(from == null ? from1 : from),
  //           body: SafeArea(
  //             child: IntroSlideEnglish(),
  //           ),
  //         );
  //       }),
  //     ),
  //   );
  // }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    throw UnimplementedError();
  }
}
