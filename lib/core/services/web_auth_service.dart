// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:convert';
import 'package:getx_firebase_app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:getx_firebase_app/data/models/user_model.dart';

class WebAuthService {
  static const String apiKey = 'AIzaSyCDOCrDFu7VWHq0kam3ovhGuFwb19kGE6Q';
  static const String signUpUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey';
  static const String signInUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey';

  Future<UserModel?> signUpWithEmail(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(signUpUrl),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return UserModel(
          uid: data['localId'],
          email: data['email'],
          displayName: data.get('displayName', 'User'),
        );
      } else {
        final error = json.decode(response.body);
        throw _getAuthError(error['error']['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> signInWithEmail(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(signInUrl),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return UserModel(
          uid: data['localId'],
          email: data['email'],
          displayName: data.get('displayName', 'User'),
        );
      } else {
        final error = json.decode(response.body);
        throw _getAuthError(error['error']['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  String _getAuthError(String errorCode) {
    switch (errorCode) {
      case 'EMAIL_EXISTS':
        return 'Email already exists';
      case 'EMAIL_NOT_FOUND':
        return 'Email not found';
      case 'INVALID_PASSWORD':
        return 'Invalid password';
      case 'USER_DISABLED':
        return 'User account disabled';
      default:
        return 'Authentication failed';
    }
  }

  Future<void> signOut() async {
    // For REST API, sign out is handled client-side
    // Just clear any stored tokens
  }
}
