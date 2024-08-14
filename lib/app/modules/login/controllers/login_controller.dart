import 'package:attendify/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  // Method untuk login
  void login() async {
    isLoading.value = true;
    await Future.delayed(
        const Duration(seconds: 2)); // Simulasi proses autentikasi

    if (email.value == 'user@example.com' && password.value == 'password') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true); // Simpan status login

      Get.offNamed(Routes.HOME); // Pindah ke halaman utama setelah login
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
    isLoading.value = false;
  }
}
