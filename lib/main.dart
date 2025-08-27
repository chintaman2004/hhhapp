import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_app/core/bindings/auth_binding.dart';
import 'package:getx_firebase_app/routes/app_pages.dart';
import 'package:getx_firebase_app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // For web, we don't need Firebase.initializeApp() since we're using REST API
  if (!kIsWeb) {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Firebase App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.SPLASH,
      initialBinding: AuthBinding(),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
