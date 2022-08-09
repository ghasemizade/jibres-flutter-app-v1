// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// class json extends StatefulWidget {
//   json({Key? key}) : super(key: key);

//   @override
//   State<json> createState() => _jsonState();
// }

// //splash
// dynamic logo;
// dynamic theme;
// dynamic title;
// dynamic desc;
// dynamic meta;
// dynamic sleep;
// dynamic from;
// dynamic to;
// dynamic primary;
// dynamic secondary;

// class _jsonState extends State<json> {
//   @override
//   void initState() {
//     super.initState();
//     _getDataSplash();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   void _getDataSplash() async {
//     var urI = Uri.parse('https://core.jibres.ir/r10/android/splash');
//     Response response = await get(urI);

//     setState(() {
//       logo = jsonDecode(response.body)["result"]["logo"];
//       theme = jsonDecode(response.body)["result"]["theme"];
//       title = jsonDecode(response.body)["result"]["title"];
//       desc = jsonDecode(response.body)["result"]["desc"];
//       meta = jsonDecode(response.body)["result"]["meta"];
//       sleep = jsonDecode(response.body)["result"]["sleep"];
//       from = jsonDecode(response.body)["result"]["bg"]["from"];
//       to = jsonDecode(response.body)["result"]["bg"]["to"];
//       primary = jsonDecode(response.body)["result"]["color"]["primary"];
//       secondary = jsonDecode(response.body)["result"]["color"]["secondary"];
//     });
//   }
// }
