import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_app_name/modules/auth/auth_controller.dart';
import 'package:your_app_name/shared/widgets/inputs/custom_textfield.dart';
import 'package:your_app_name/shared/widgets/buttons/primary_button.dart';
import 'package:your_app_name/shared/widgets/buttons/social_button.dart';

class LoginView extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Center(
                child: Image.network(
                  'https://your-logo-url.com/logo.png',
                  height: 80,
                  width: 80,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Login to Your Account',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) =>
                            controller.toggleRememberMe(value!),
                      ),
                      Text('Remember me'),
                      Spacer(),
                      TextButton(
                        onPressed: () => Get.toNamed('/reset-password'),
                        child: Text('Forgot password?'),
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              Obx(() => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : PrimaryButton(
                      text: 'Sign in',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.login(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                        }
                      },
                      width: double.infinity,
                    )),
              SizedBox(height: 20),
              Center(child: Text('or continue with')),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: Icons.g_mobiledata,
                    onPressed: () => controller.signInWithGoogle(),
                  ),
                  SizedBox(width: 20),
                  SocialButton(
                    icon: Icons.facebook,
                    onPressed: () => controller.signInWithFacebook(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () => Get.toNamed('/signup'),
                      child: Text('Sign up'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
