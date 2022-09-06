import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/introJson.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/languageScreen/DataLang.dart';
import 'package:flutter_application_1/splashScreen/splash_V1.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IntroPersianCustomer extends StatefulWidget {
  const IntroPersianCustomer({Key? key}) : super(key: key);

  @override
  State<IntroPersianCustomer> createState() => _IntroPersianCustomerState();
}

class _IntroPersianCustomerState extends State<IntroPersianCustomer> {
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(from1),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demoData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: ((context, index) => IntroPersianCustomerContent(
                        image: demoData[index].image,
                        titles: demoData[index].titles,
                        description: demoData[index].description,
                      )),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Container(
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Text(
                          _pageIndex == 0 ? '' : 'قبلی',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0.0,
                        ),
                      ),
                      SizedBox(
                        width: 70.0,
                      ),
                      ...List.generate(
                        demoData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: DotIndicator(
                            isActive: index == _pageIndex,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_pageIndex == 0 || _pageIndex == 1) {
                            _pageController.nextPage(
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 500),
                            );
                          } else if (_pageIndex == 2) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Scaffold(
                                backgroundColor: HexColor(from1),
                                body: SafeArea(
                                  child: WebView(
                                    initialUrl: urlhomefa,
                                    zoomEnabled: false,
                                    javascriptMode: JavascriptMode.unrestricted,
                                  ),
                                ),
                              );
                            }));
                          }
                        },
                        child: Text(
                          _pageIndex == 2 ? 'تمام' : 'بعدی',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ])
            ],
          ),
        ));
  }
}

late PageController _pageController;
//List<Widget> slideList = [];
//int initialPage = 3;
int _pageIndex = 0;

class Onboard {
  final String image, titles, description;

  Onboard({
    required this.image,
    required this.titles,
    required this.description,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: 'Images/1.png',
    titles: title_fa,
    description: desc_fa,
  ),
  Onboard(
    image: 'Images/2.png',
    titles: title_fa_1,
    description: desc_fa_1,
  ),
  Onboard(
    image: 'Images/3.png',
    titles: title_fa_2,
    description: desc_fa_2,
  ),
];

class IntroPersianCustomerContent extends StatefulWidget {
  const IntroPersianCustomerContent(
      {Key? key,
      required this.image,
      required this.titles,
      required this.description})
      : super(key: key);

  final String image, titles, description;

  @override
  State<IntroPersianCustomerContent> createState() =>
      _IntroPersianCustomerContentState();
}

class _IntroPersianCustomerContentState
    extends State<IntroPersianCustomerContent> {
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
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      height: 230.0,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120.0,
                            ),
                            Text(
                              widget.titles,
                              style: TextStyle(fontSize: 28.0),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              widget.description,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 250.0),
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
                  height: 10.0,
                ),
                Center(
                  child: SizedBox(
                    height: 460.0,
                    width: 345.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Image(
                        image: AssetImage(widget.image),
                      ),
                      elevation: 18,
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

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: isActive ? 12 : 6,
      decoration: BoxDecoration(
        color: HexColor(from1),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
