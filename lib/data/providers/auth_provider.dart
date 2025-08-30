import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_app_name/data/models/user_model.dart';

class AuthProvider extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      throw 'Failed to create user: ${e.toString()}';
    }
  }

  Future<UserModel?> getUser(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    } catch (e) {
      throw 'Failed to get user: ${e.toString()}';
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toMap());
    } catch (e) {
      throw 'Failed to update user: ${e.toString()}';
    }
  }

  Future<void> addFavoriteProperty(String userId, String propertyId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'favoriteProperties': FieldValue.arrayUnion([propertyId]),
      });
    } catch (e) {
      throw 'Failed to add favorite property: ${e.toString()}';
    }
  }

  Future<void> removeFavoriteProperty(String userId, String propertyId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'favoriteProperties': FieldValue.arrayRemove([propertyId]),
      });
    } catch (e) {
      throw 'Failed to remove favorite property: ${e.toString()}';
    }
  }
}
