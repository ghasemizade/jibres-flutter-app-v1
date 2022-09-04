import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/splashScreen/splash_V1.dart';
import 'package:hexcolor/hexcolor.dart';

class IntroEnglishCustomer extends StatefulWidget {
  const IntroEnglishCustomer({Key? key}) : super(key: key);

  @override
  State<IntroEnglishCustomer> createState() => _IntroEnglishCustomerState();
}

class _IntroEnglishCustomerState extends State<IntroEnglishCustomer> {
  late PageController _pageController;
  List<Widget> slideList = [];
  int initialPage = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(from1),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: ((context, index) => IntroEnglishCustomerContent(
                        image: 'Images/Jibres-Logo-icon-512.png',
                        titles: title1,
                        description: desc1,
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}

class IntroEnglishCustomerContent extends StatelessWidget {
  const IntroEnglishCustomerContent(
      {Key? key,
      required this.image,
      required this.titles,
      required this.description})
      : super(key: key);

  final String image, titles, description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      height: 280.0,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120.0,
                            ),
                            Text(
                              titles,
                              style: TextStyle(fontSize: 28.0),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              description,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: SizedBox(
                    height: 450.0,
                    width: 300.0,
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image(
                            image: AssetImage(image),
                            width: 100.0,
                          ),
                          elevation: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      height: 280.0,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100.0,
                            ),
                            Text(
                              title1,
                              style: TextStyle(fontSize: 28.0),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              desc1,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                        Icons.keyboard_arrow_right_outlined),
                                    style: ElevatedButton.styleFrom(
                                      primary: HexColor(from1),
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: SizedBox(
                    height: 450.0,
                    width: 300.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Image(
                        image: AssetImage(image),
                        width: 100.0,
                      ),
                      elevation: 35,
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
}
