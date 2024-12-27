import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gramaseva/app/modules/Form/views/form_view.dart';
import 'package:gramaseva/app/modules/Home/views/home_view.dart';
import 'package:gramaseva/app/modules/Login/views/login_view.dart';

import 'app/modules/InternetConnectivityChecker/views/internet_connectivity_checker_view.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

/// Main Application Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/home', page: () => HomeView()),
        GetPage(name: '/form', page: () => FormView()),
      ],
      // Bind the Internet Connectivity Checker
      builder: (context, child) {
        return InternetConnectivityChecker(child: child!);
      },
    );
  }
}

