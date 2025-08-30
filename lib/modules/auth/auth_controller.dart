import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var rememberMe = false.obs;
  var isLoading = false.obs;
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    // Check if user is already signed in
    user.bindStream(_auth.authStateChanges());
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar('Login Failed', e.message ?? 'An error occurred');
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar('Sign Up Failed', e.message ?? 'An error occurred');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      isLoading.value = false;
      Get.offAllNamed('/home');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Google Sign In Failed', e.toString());
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      isLoading.value = true;
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        isLoading.value = false;
        Get.offAllNamed('/home');
      } else {
        isLoading.value = false;
        Get.snackbar('Facebook Login Failed', 'User cancelled login');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Facebook Sign In Failed', e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    Get.offAllNamed('/login');
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset email sent');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    }
  }
}
