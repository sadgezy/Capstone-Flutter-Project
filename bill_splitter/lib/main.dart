import 'package:bill_splitter/apps/routes/app_routes.dart';
import 'package:bill_splitter/presentation/myapp.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/contacts_controller.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/splits_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

void main() {
  Get.lazyPut(() => ContactsController());
  Get.put(SplitController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: AppRoutes.routes,
      themeMode: ThemeMode.dark,
      home: MyApp(),
    );
  }
}
