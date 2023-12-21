import 'package:bill_splitter/presentation/screen/home_page/views/home_screen.dart';
import 'package:bill_splitter/presentation/screen/login_signup/login.dart';
import 'package:bill_splitter/presentation/screen/split_feature/views/divide_split_screen.dart';
import 'package:bill_splitter/presentation/screen/split_feature/views/split_screen.dart';
import 'package:bill_splitter/presentation/screen/welcome_screen/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => WelcomeScreen()),
    GetPage(
        name: '/login',
        page: () => LoginReg(),
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 400),
        curve: Curves.easeInBack),
    GetPage(
        name: '/home',
        page: () => HomeScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 400),
        curve: Curves.easeInOut),
    GetPage(
        name: '/new_split',
        page: () => SplitScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 400),
        curve: Curves.easeInOut),
    GetPage(
        name: '/divide',
        page: () => DivideSplitScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 400),
        curve: Curves.easeInOut),
  ];
}
