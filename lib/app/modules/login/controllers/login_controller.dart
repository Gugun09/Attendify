import 'package:attendify/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var isLoading = false.obs;

  // Method untuk login
  void login() async {
    if (emailC.text.isEmpty || passC.text.isEmpty) {
      Get.snackbar("Error", "Email dan password tidak boleh kosong");
    }
    try {
      isLoading.value = true;
      if (emailC.text == 'user@example.com' && passC.text == 'password') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true); // Simpan status login

        Get.offNamed(Routes.HOME); // Pindah ke halaman utama setelah login
      } else {
        Get.snackbar('Login Failed', 'Invalid email or password');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
