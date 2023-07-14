import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices extends GetxController {
  static StorageServices get to => Get.find();
  final storage = GetStorage();

  Future<void> write({required String key, value}) async {
    return await storage.write(key, value);
  }

  String read({required String key}) {
    return storage.read(key);
  }

  Future<void> remove({required String key}) async {
    return await storage.remove(key);
  }
}
