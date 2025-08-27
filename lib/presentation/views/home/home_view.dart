import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_app/presentation/controllers/auth_controller.dart';
import 'package:getx_firebase_app/routes/app_routes.dart';

class HomeView extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _authController.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Home Screen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.DETAILS);
              },
              child: const Text('Go to Details'),
            ),
            const SizedBox(height: 20),
            Obx(() => _authController.user.value != null
                ? Text(
                    'Logged in as: ${_authController.user.value?.email}',
                    style: const TextStyle(fontSize: 16),
                  )
                : const SizedBox()),
          ],
        ),
      ),
    );
  }
}
