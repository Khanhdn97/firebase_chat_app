import 'package:get/get.dart';
import 'package:login_firebase/pages/welcome/controller.dart';

class WelcomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController());
  }

}