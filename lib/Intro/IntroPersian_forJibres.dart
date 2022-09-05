import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/introJson.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/languageScreen/DataLang.dart';
import 'package:flutter_application_1/splashScreen/splash_V1.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IntroSlide extends StatefulWidget {
  const IntroSlide({Key? key}) : super(key: key);

  @override
  State<IntroSlide> createState() => _IntroSlideState();
}

class _IntroSlideState extends State<IntroSlide> {
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
                itemBuilder: ((context, index) => IntroSlideContent(
                      titles: demoData[index].titles,
                      description: demoData[index].description,
                    )),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                height: 50,
                color: Color.fromARGB(255, 150, 7, 67),
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
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 150, 7, 67),
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
                        _pageIndex == 2 ? 'پایان' : 'بعدی',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 150, 7, 67),
                        elevation: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

Widget nextPageArrow() {
  return Icon(Icons.arrow_right);
}

late PageController _pageController;
int _pageIndex = 0;

class Onboard {
  final String titles, description;

  Onboard({
    required this.titles,
    required this.description,
  });
}

final List<Onboard> demoData = [
  Onboard(
    titles: title_fa,
    description: desc_fa,
  ),
  Onboard(
    titles: title_fa_1,
    description: desc_fa_1,
  ),
  Onboard(
    titles: title_fa_2,
    description: desc_fa_2,
  ),
];

class IntroSlideContent extends StatefulWidget {
  const IntroSlideContent(
      {Key? key, required this.titles, required this.description})
      : super(key: key);

  final String titles, description;

  @override
  State<IntroSlideContent> createState() => _IntroSlideContentState();
}

class _IntroSlideContentState extends State<IntroSlideContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.titles,
            style: TextStyle(fontSize: 28.0, color: Colors.white),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            widget.description,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
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
      height: isActive ? 12 : 6,
      width: 6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
