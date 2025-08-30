import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_app_name/modules/auth/auth_controller.dart';
import 'package:your_app_name/shared/widgets/inputs/custom_textfield.dart';
import 'package:your_app_name/shared/widgets/buttons/primary_button.dart';

class ResetPasswordView extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Reset Password',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 10),
              Text(
                'Enter your email address and we will send you a link to reset your password.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 30),
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
              SizedBox(height: 30),
              Obx(() => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : PrimaryButton(
                      text: 'Send Reset Link',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller
                              .resetPassword(_emailController.text.trim());
                          Get.snackbar(
                            'Success',
                            'Password reset link has been sent to your email',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                          Future.delayed(
                              Duration(seconds: 2), () => Get.back());
                        }
                      },
                      width: double.infinity,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
