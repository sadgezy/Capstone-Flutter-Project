import 'package:bill_splitter/apps/routes/app_routes.dart';
import 'package:bill_splitter/presentation/screen/welcome_screen/views/landings/landings1.dart';
import 'package:bill_splitter/presentation/screen/welcome_screen/views/landings/landings2.dart';
import 'package:bill_splitter/presentation/screen/welcome_screen/views/landings/landings3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

bool isLast = false;

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.topStart, children: [
      Positioned.fill(
        child: SizedBox(
          height: screenHeight * 0.7,
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                isLast = index == 2;
              });
            },
            controller: _controller,
            children: [LandingPage1(), LandingPage2(), LandingPage3()],
          ),
        ),
      ),
      Positioned(
        bottom: 166,
        left: 0,
        right: 0,
        child: Align(
          alignment: Alignment.center,
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
                activeDotColor: Color.fromRGBO(0, 82, 213, 1),
                dotColor: Color.fromRGBO(217, 217, 217, 1)),
          ),
        ),
      ),
      Positioned(
        bottom: -0.1,
        left: 0.0,
        right: 0.0,
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 82, 213, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        if (!isLast) {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        } else {
                          Get.toNamed('/login');
                        }
                      },
                      child: AnimatedContainer(
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 400),
                        width: isLast ? screenWidth : screenHeight * 0.15,
                        height: 75,
                        decoration: BoxDecoration(
                          color: isLast
                              ? Color.fromRGBO(0, 52, 213, 1)
                              : Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: isLast
                            ? Center(
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontFamily: 'AntipastoPro',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              )
                            : Image.asset(
                                'assets/arrow.png',
                                color: Color.fromRGBO(0, 82, 213, 1),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
