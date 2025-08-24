// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SignInView extends StatelessWidget {
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
            Icon(Icons.lock, size: 80, color: Colors.deepPurple),
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
              onPressed: () => authController.login(
                emailController.text.trim(),
                passController.text.trim(),
              ),
              child: Text("Sign In"),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/signup'),
              child: Text("Don't have an account? Sign Up"),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () => authController.signInWithGoogle(),
              child: Text("Sign in with Google"),
            ),
            ElevatedButton(
              onPressed: () => authController.signInWithFacebook(),
              child: Text("Sign in with Facebook"),
            ),
            ElevatedButton(
              onPressed: () => authController.signInWithApple(),
              child: Text("Sign in with Apple"),
            ),
          ],
        ),
      ),
    );
  }
}
