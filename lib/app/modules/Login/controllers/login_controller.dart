import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final box = GetStorage();
  final loginError = ''.obs;

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!GetUtils.isEmail(email)) {
      loginError.value = "Invalid email format";
      return;
    }

    if (password.length < 6) {
      loginError.value = "Password must be at least 6 characters";
      return;
    }


    final storedEmail = box.read('email') ?? 'sree@sree.com';
    final storedPassword = box.read('password') ?? 'pass12345';

    if (email.isNotEmpty /*== storedEmail*/ && password.isNotEmpty /*== storedPassword*/) {
      saveCredentials(email, password);
      Get.offNamed('/home');
    } else {
      loginError.value = "Enter valid credentials";
    }
  }

  void saveCredentials(String email, String password) {
    box.write('email', email);
    box.write('password', password);

  }

  void logout() {
    box.remove('email');
    box.remove('password');
    Get.offNamed('/login');
  }
}
