import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_app/presentation/controllers/auth_controller.dart';

class DetailsView extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_outline,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Details Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Obx(() => _authController.user.value != null
                ? Column(
                    children: [
                      Text(
                        'User ID: ${_authController.user.value?.uid}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email: ${_authController.user.value?.email}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : const SizedBox()),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
