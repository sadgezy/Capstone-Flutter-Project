import 'package:flutter/material.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 50,
          ),
          const Text('Track your payments easily',
              style: TextStyle(
                fontFamily: 'AntipastoPro',
                fontWeight: FontWeight.w600,
                fontSize: 70,
                color: Color.fromRGBO(0, 82, 213, 1),
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
              'Ditch the sheets and effortlessly monitor your part of the tab.',
              style: TextStyle(
                fontFamily: 'AntipastoPro',
                fontSize: 16,
              )),
          Image.asset('assets/landing/landing1.png',
              height: (screenHeight * 0.48)),
        ]),
      ),
    );
  }
}
