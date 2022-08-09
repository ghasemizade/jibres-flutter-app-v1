import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

//introfa
dynamic title1;
dynamic desc1;
dynamic subtitle2;
dynamic desc2;
dynamic subtitle5;

class json extends StatefulWidget {
  json({Key? key}) : super(key: key);

  @override
  State<json> createState() => _jsonState();
}

class _jsonState extends State<json> {
  @override
  void initState() {
    _getDataIntro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _getDataIntro() async {
    var urI = Uri.parse('https://core.jibres.ir/r10/android/intro');
    Response response = await get(urI);

    setState(() {
      title1 = jsonDecode(response.body)["result"]["page"][0]["title"];
      desc1 = jsonDecode(response.body)["result"]["page"][0]["decs"];
      subtitle2 = jsonDecode(response.body)["result"]["page"][1]["subtitle"];
      desc2 = jsonDecode(response.body)["result"]["page"][1]["desc"];
      subtitle5 = jsonDecode(response.body)["result"]["page"][4]["subtitle"];
    });
  }
}
