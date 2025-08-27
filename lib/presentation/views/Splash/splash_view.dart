import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_app/presentation/controllers/auth_controller.dart';

class SplashView extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.flutter_dash,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'GetX Firebase App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => _authController.isLoading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : const SizedBox()),
          ],
        ),
      ),
    );
  }
}
