import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/internet_connectivity_checker_controller.dart';

class InternetConnectivityChecker extends StatelessWidget {
  final Widget child;

  const InternetConnectivityChecker({required this.child});

  @override
  Widget build(BuildContext context) {
    Get.put(InternetConnectivityCheckerController()); // Initialize the Controller
    return Obx(() {
      final isConnected = Get.find<InternetConnectivityCheckerController>().isConnected.value;
      return Stack(
        children: [
          child,
          if (!isConnected)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.red,
               // padding: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.wifi_off, color: Colors.white),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          'Please connect to the internet',
                          style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Airel'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
