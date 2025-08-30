import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FirestoreService> init() async {
    return this;
  }

  // CRUD operations for any collection
  Future<void> addDocument(String collection, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).add(data);
    } catch (e) {
      throw 'Failed to add document: ${e.toString()}';
    }
  }

  Future<void> updateDocument(
      String collection, String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(id).update(data);
    } catch (e) {
      throw 'Failed to update document: ${e.toString()}';
    }
  }

  Future<void> deleteDocument(String collection, String id) async {
    try {
      await _firestore.collection(collection).doc(id).delete();
    } catch (e) {
      throw 'Failed to delete document: ${e.toString()}';
    }
  }

  Stream<QuerySnapshot> getCollectionStream(String collection) {
    return _firestore.collection(collection).snapshots();
  }

  Future<DocumentSnapshot> getDocument(String collection, String id) async {
    try {
      return await _firestore.collection(collection).doc(id).get();
    } catch (e) {
      throw 'Failed to get document: ${e.toString()}';
    }
  }

  // Property-specific methods
  Stream<QuerySnapshot> getPropertiesStream() {
    return _firestore
        .collection('properties')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> toggleWishlist(String userId, String propertyId) async {
    try {
      final wishlistDoc = await _firestore
          .collection('wishlists')
          .doc('${userId}_$propertyId')
          .get();

      if (wishlistDoc.exists) {
        await wishlistDoc.reference.delete();
      } else {
        await _firestore
            .collection('wishlists')
            .doc('${userId}_$propertyId')
            .set({
          'userId': userId,
          'propertyId': propertyId,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      throw 'Failed to toggle wishlist: ${e.toString()}';
    }
  }

  Stream<QuerySnapshot> getUserWishlist(String userId) {
    return _firestore
        .collection('wishlists')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }
}
