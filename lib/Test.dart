import 'package:flutter/material.dart';

class test1 extends StatefulWidget {
  const test1({Key? key}) : super(key: key);

  @override
  State<test1> createState() => _test1State();
}

class _test1State extends State<test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text('hi'),
      )),
    );
  }
}
