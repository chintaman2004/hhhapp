import 'package:flutter/foundation.dart';
import 'package:getx_firebase_app/core/services/mobile_auth_service.dart';
import 'package:getx_firebase_app/core/services/web_auth_service.dart';
import 'package:getx_firebase_app/data/model/user_model.dart';

class AuthService {
  late final dynamic _authImplementation;

  AuthService() {
    if (kIsWeb) {
      _authImplementation = WebAuthService();
    } else {
      _authImplementation = MobileAuthServiceImpl();
    }
  }

  Future<UserModel?> signUpWithEmail(String email, String password) {
    return _authImplementation.signUpWithEmail(email, password);
  }

  Future<UserModel?> signInWithEmail(String email, String password) {
    return _authImplementation.signInWithEmail(email, password);
  }

  Future<void> signOut() {
    return _authImplementation.signOut();
  }
}
