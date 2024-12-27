import 'package:get/get.dart';

import '../controllers/internet_connectivity_checker_controller.dart';

class InternetConnectivityCheckerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetConnectivityCheckerController>(
      () => InternetConnectivityCheckerController(),
    );
  }
}
