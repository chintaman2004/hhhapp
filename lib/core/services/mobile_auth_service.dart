import 'package:firebase_auth/firebase_auth.dart';
import 'package:getx_firebase_app/data/model/user_model.dart';

class MobileAuthServiceImpl {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(result.user!);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(result.user!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
