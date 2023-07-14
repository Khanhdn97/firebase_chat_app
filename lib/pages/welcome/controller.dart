import 'package:get/get.dart';
class WelcomeController extends GetxController{
  WelcomeController();
  final title = 'Chat app';

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 0),()=> Get.toNamed('/signing'));
  }
}