import 'package:get/get.dart';
import 'package:your_app_name/modules/auth/auth_controller.dart';
import 'package:your_app_name/data/repositories/auth_repository.dart';
import 'package:your_app_name/core/services/auth_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
