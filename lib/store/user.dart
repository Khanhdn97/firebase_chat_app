import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_firebase/services/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  final _isLogin = false.obs;
  final _profile = UserInfo({}).obs;
  final _token = '';

  bool get isLogin => _isLogin.value;

  UserInfo get profile => _profile.value;

  Future<void> saveProfile({required UserInfo user}) async {
    _profile.value = user;
    _isLogin.value = true;
    Map<String, dynamic> profileData = {
      'displayName': user.displayName,
      'uid': user.uid,
      'email': user.email??'none',
      'photoURL': user.photoURL??'none',
      'phoneNumber': user.phoneNumber??'none',
      'providerId' : user.providerId??'none'
    };
    String jsonProfileData = jsonEncode(profileData);
    await StorageServices.to.write(key: 'profile', value: jsonProfileData);
  }
  UserInfo getProfile()  {
    String jsonProfileData = StorageServices.to.read(key: 'profile');
    Map<String,dynamic> profileData = jsonDecode(jsonProfileData);
    Map<String,String?> userProfileData = profileData.map((key, value) => MapEntry(key, value.toString()));
    return UserInfo(userProfileData);
  }

  @override
  void onInit() {
    super.onInit();
  }
}