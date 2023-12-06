import 'package:bill_splitter/presentation/screen/login_screen/views/login_screen.dart';
import 'package:bill_splitter/presentation/screen/welcome_screen/views/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => WelcomeScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    // Add more routes here
  ];
}
