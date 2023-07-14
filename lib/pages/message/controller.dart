import 'package:get/get.dart';
class MessageController extends GetxController{
  MessageController();
  final title = 'Message Page';

  void goProfile () async {
    await Get.toNamed('/profile');
  }
  @override
  void onReady() {
    super.onReady();
  }
}