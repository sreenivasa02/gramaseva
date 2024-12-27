import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../modules/Form/bindings/form_binding.dart';
import '../modules/Form/views/form_view.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/InternetConnectivityChecker/bindings/internet_connectivity_checker_binding.dart';
import '../modules/InternetConnectivityChecker/views/internet_connectivity_checker_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => FormView(),
      binding: FormBinding(),
    ),
    GetPage(
      name: _Paths.INTERNET_CONNECTIVITY_CHECKER,
      page: () =>  InternetConnectivityChecker(child: Container(),),
      binding: InternetConnectivityCheckerBinding(),
    ),
  ];
}
