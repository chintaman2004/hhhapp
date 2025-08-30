import 'package:get/get.dart';
import 'package:your_app_name/modules/home/home_controller.dart';
import 'package:your_app_name/data/repositories/property_repository.dart';
import 'package:your_app_name/core/services/firestore_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirestoreService>(() => FirestoreService());
    Get.lazyPut<PropertyRepository>(() => PropertyRepository());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
