import 'package:flutter/material.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'data/modle/splashJson.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(from == null ? from1 : from),
      body: SafeArea(
        child: WebView(
          initialUrl: ('https://jibres.ir/enter?referer=my'),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
