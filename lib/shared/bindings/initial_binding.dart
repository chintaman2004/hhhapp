import 'package:get/get.dart';
import 'package:your_app_name/core/services/auth_service.dart';
import 'package:your_app_name/core/services/firestore_service.dart';
import 'package:your_app_name/core/services/storage_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
    Get.put(FirestoreService(), permanent: true);
    Get.put(StorageService(), permanent: true);
  }
}
