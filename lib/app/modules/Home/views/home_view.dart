import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(homeController.box.read('email')),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notification_important_outlined))],backgroundColor: Colors.lightBlueAccent.withOpacity(0.2), ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(

          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [

                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle,
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'CITIZEN',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 10, left: 25,
                            child: Icon(Icons.home, size: 24, color: Colors.white),
                          ),
                          Positioned(
                            top: 10, right: 25,
                            child: Icon(Icons.search, size: 24, color: Colors.white),
                          ),
                          Positioned(
                            left: 10, bottom: 28,
                            child: Icon(Icons.notifications, size: 24, color: Colors.white),
                          ),
                          Positioned(
                            right: 10, bottom: 25,
                            child: Icon(Icons.settings, size: 24, color:Colors.white),
                          ),
                          Positioned(
                            top: 60, left: 10,
                            child: Icon(Icons.account_circle, size: 24, color: Colors.white),
                          ),
                          Positioned(
                            top: 120, right: 60,
                            child: Icon(Icons.help, size: 24, color: Colors.white),
                          ),
                          Positioned(
                            bottom: 60, right: 5,
                            child: Icon(Icons.info, size: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "We are now onboard \nAll Citizen Services",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

      Expanded(
              child: ListView.builder(
                itemCount: homeController.services.length,
                itemBuilder: (context, index) {
                  final service = homeController.services[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        leading:service['Image'] != null
                            ? Base64ImageWidget(base64String:service['Image'])
                            : const Icon(Icons.image_not_supported),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(service['ServiceName']),
                            IconButton(onPressed: () {
                              Get.toNamed('/form', arguments: {'image':service['Image'],'serviceName':service['ServiceName']});
                            }, icon: Icon(Icons.arrow_forward_ios_outlined))
                          ],
                        ),
                       /* onTap: () {
                          Get.toNamed('/form', arguments: service);
                        },*/
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
class Base64ImageWidget extends StatelessWidget {
  final String base64String;

  const Base64ImageWidget({required this.base64String});

  @override
  Widget build(BuildContext context) {

    final String cleanBase64 = base64String
        .split(',')
        .last;


    Uint8List imageBytes = base64Decode(cleanBase64);

    return Image.memory(imageBytes);
  }
}