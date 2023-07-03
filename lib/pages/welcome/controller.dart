import 'package:get/get.dart';
import 'package:login_firebase/pages/welcome/state.dart';
class WelcomeController extends GetxController{
  WelcomeController();
  final title = 'Chat app';
  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2),()=> Get.toNamed('/message'));
  }
}