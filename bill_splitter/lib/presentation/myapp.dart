import 'package:bill_splitter/presentation/screen/welcome_screen/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: WelcomeScreen(),
    );
  }
}
