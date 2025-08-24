// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SignUpView extends StatelessWidget {
  final AuthController authController = Get.find();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add, size: 80, color: Colors.deepPurple),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => authController.register(
                emailController.text.trim(),
                passController.text.trim(),
              ),
              child: Text("Sign Up"),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/signin'),
              child: Text("Already have an account? Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
