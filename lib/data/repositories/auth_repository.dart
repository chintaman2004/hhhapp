import 'package:get/get.dart';
import 'package:your_app_name/core/services/auth_service.dart';
import 'package:your_app_name/data/providers/auth_provider.dart';
import 'package:your_app_name/data/models/user_model.dart';

class AuthRepository extends GetxService {
  final AuthService _authService = Get.find<AuthService>();
  final AuthProvider _authProvider = Get.find<AuthProvider>();

  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _authService.currentUser.value;
      if (user != null) {
        return await _authProvider.getUser(user.uid);
      }
      return null;
    } catch (e) {
      throw 'Failed to get current user: ${e.toString()}';
    }
  }

  Future<void> createUserProfile(UserModel user) async {
    try {
      await _authProvider.createUser(user);
    } catch (e) {
      throw 'Failed to create user profile: ${e.toString()}';
    }
  }

  Future<void> updateUserProfile(UserModel user) async {
    try {
      await _authProvider.updateUser(user);
    } catch (e) {
      throw 'Failed to update user profile: ${e.toString()}';
    }
  }

  Future<void> addToFavorites(String userId, String propertyId) async {
    try {
      await _authProvider.addFavoriteProperty(userId, propertyId);
    } catch (e) {
      throw 'Failed to add to favorites: ${e.toString()}';
    }
  }

  Future<void> removeFromFavorites(String userId, String propertyId) async {
    try {
      await _authProvider.removeFavoriteProperty(userId, propertyId);
    } catch (e) {
      throw 'Failed to remove from favorites: ${e.toString()}';
    }
  }
}
