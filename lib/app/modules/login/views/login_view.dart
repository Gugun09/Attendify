import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            children: [
              TextField(
                controller: controller.emailC,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: controller.passC,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              if (controller.isLoading.value)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () => controller.login(),
                  child: const Text('Login'),
                ),
            ],
          );
        }),
      ),
    );
  }
}
