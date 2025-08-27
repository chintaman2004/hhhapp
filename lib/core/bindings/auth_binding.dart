import 'package:get/get.dart';
import 'package:getx_firebase_app/core/services/auth_service.dart';
import 'package:getx_firebase_app/presentation/controllers/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
