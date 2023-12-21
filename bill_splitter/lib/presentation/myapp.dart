import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/home_screen.dart';
import 'package:bill_splitter/presentation/screen/split_feature/views/split_screen.dart';
import 'package:bill_splitter/presentation/screen/welcome_screen/views/welcome_screen.dart';
import 'package:flutter/material.dart';
// import 'package:get/utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: SplitScreen(),
      ),
    );
  }
}
