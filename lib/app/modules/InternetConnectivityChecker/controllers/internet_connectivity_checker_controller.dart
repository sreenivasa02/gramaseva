import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetConnectivityCheckerController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isConnected.value = result != ConnectivityResult.none;
      if (!isConnected.value) {
        print('No Internet');

      }else{
         Get.snackbar(
          "Internet",
          " Internet connected.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      }
    });
  }

  Future<void> _checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    isConnected.value = result != ConnectivityResult.none;
  }


}
