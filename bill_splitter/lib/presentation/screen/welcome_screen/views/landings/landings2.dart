import 'package:flutter/material.dart';

class LandingPage2 extends StatelessWidget {
  const LandingPage2({super.key});

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
          const Text('Keep a record of expenses',
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
              'Whip your camera out and quickly scan, save, and share every invoice.',
              style: TextStyle(
                fontFamily: 'AntipastoPro',
                fontSize: 16,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/landing/landing2.png',
                height: screenHeight * 0.48),
          ),
        ]),
      ),
    );
  }
}
