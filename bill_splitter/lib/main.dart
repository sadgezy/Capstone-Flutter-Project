import 'package:bill_splitter/apps/routes/app_routes.dart';
import 'package:bill_splitter/model/split_list.dart';
import 'package:bill_splitter/presentation/myapp.dart';
import 'package:bill_splitter/presentation/screen/home_page/controllers/homepage_controller.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/contacts_controller.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/split_list_provider.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/splits_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  Get.lazyPut(() => ContactsController());
  Get.put(SplitController());
  Get.put(HomePageController());
  runApp(
    ChangeNotifierProvider(
      create: (context) => SplitListProvider(
        Split(
          billItems: [],
          selectedContacts: [],
          splitTitle: '',
          dueDate: '',
          splitTotal: 0,
        ),
      ),
      child: const MainApp(),
    ),
  );
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
