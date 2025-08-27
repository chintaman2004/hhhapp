import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? displayName;

  UserModel({
    this.uid,
    this.email,
    this.displayName,
  });

  // Factory method to create UserModel from Firebase User
  factory UserModel.fromFirebaseUser(dynamic user) {
    if (user is User) {
      return UserModel(
        uid: user.uid,
        email: user.email,
        displayName: user.displayName,
      );
    }
    return UserModel(
      uid: user['uid'],
      email: user['email'],
      displayName: user['displayName'],
    );
  }

  // Convert to map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
    };
  }

  // Create from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
    );
  }
}
