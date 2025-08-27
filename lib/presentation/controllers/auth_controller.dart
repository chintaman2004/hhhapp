import 'package:get/get.dart';
import 'package:getx_firebase_app/core/services/auth_service.dart';
import 'package:getx_firebase_app/data/model/user_model.dart';
import 'package:getx_firebase_app/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    // For web, we'll handle authentication state differently
    // You might want to store auth state in local storage for web
    Get.offAllNamed(AppRoutes.SIGNIN);
    super.onInit();
  }

  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true;
      final user = await _authService.signUpWithEmail(email, password);
      if (user != null) {
        this.user.value = user;
        Get.snackbar('Success', 'Account created successfully!');
        Get.offAllNamed(AppRoutes.HOME);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      final user = await _authService.signInWithEmail(email, password);
      if (user != null) {
        this.user.value = user;
        Get.snackbar('Success', 'Signed in successfully!');
        Get.offAllNamed(AppRoutes.HOME);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      user.value = null;
      Get.snackbar('Success', 'Signed out successfully!');
      Get.offAllNamed(AppRoutes.SIGNIN);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
