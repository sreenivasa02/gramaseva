import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
      Center(
      child: Stack(
      alignment: Alignment.center,
        children: [

          Container(
            height: 200,
            width: Get.width,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.withOpacity(0.4),
                      Colors.lightBlueAccent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Grama seva',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We are on board for all citizen services',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(20),
      child: Column(children: [
      TextField(
        controller: controller.emailController,
        decoration: InputDecoration(labelText: 'Email'),
      ),
      TextField(
        controller: controller.passwordController,
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password'),
      ),
      Obx(() => Text(
        controller.loginError.value,
        style: TextStyle(color: Colors.red),
      )),
      ElevatedButton(
        onPressed: controller.login,
        child: const Text("Login"),
      ),
    ]),),

        ],
      ),
    );
  }
}
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}