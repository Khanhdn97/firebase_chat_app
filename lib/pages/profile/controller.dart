import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_firebase/store/user.dart';
class ProfileController extends GetxController{
  final title = 'profile';
  final UserInfo profile = UserStore.to.getProfile();
  @override
  void onReady() {
    super.onReady();
  }
}