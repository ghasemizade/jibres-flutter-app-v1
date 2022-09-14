import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/introData.dart';
import 'package:flutter_application_1/data/modle/splashData.dart';

import 'package:flutter_application_1/languageScreen/DataLang.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IntroSlideEnglish extends StatefulWidget {
  const IntroSlideEnglish({Key? key}) : super(key: key);

  @override
  State<IntroSlideEnglish> createState() => _IntroSlideEnglishState();
}

class _IntroSlideEnglishState extends State<IntroSlideEnglish> {
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
                itemBuilder: ((context, index) => IntroSlideEnglishContent(
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
                        _pageIndex == 0 ? '' : 'back',
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
                                  initialUrl: urlhomeen,
                                  zoomEnabled: false,
                                  javascriptMode: JavascriptMode.unrestricted,
                                ),
                              ),
                            );
                          }));
                        }
                      },
                      child: Text(
                        _pageIndex == 2 ? 'done' : 'next',
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
    titles: title_en,
    description: desc_en,
  ),
  Onboard(
    titles: title_en_1,
    description: desc_en_1,
  ),
  Onboard(
    titles: title_en_2,
    description: desc_en_2,
  ),
];

class IntroSlideEnglishContent extends StatefulWidget {
  const IntroSlideEnglishContent(
      {Key? key, required this.titles, required this.description})
      : super(key: key);

  final String titles, description;

  @override
  State<IntroSlideEnglishContent> createState() =>
      _IntroSlideEnglishContentState();
}

class _IntroSlideEnglishContentState extends State<IntroSlideEnglishContent> {
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
