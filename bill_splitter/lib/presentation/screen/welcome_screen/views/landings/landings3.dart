import 'package:flutter/material.dart';

class LandingPage3 extends StatelessWidget {
  const LandingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 50,
          ),
          const Text('Split the bill up with friends',
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
              'Conveniently divide the receipt every time you go on a trip or have a nice dinner together.',
              style: TextStyle(
                fontFamily: 'AntipastoPro',
                fontSize: 16,
              )),
          Image.asset(
            'assets/landing/landing3.png',
            height: screenHeight * 0.48,
          ),
        ]),
      ),
    );
  }
}
