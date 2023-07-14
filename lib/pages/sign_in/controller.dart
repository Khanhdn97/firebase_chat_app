import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/auth.dart';
import 'package:login_firebase/store/user.dart';

class SignInController extends GetxController{
  SignInController();
  final title = 'SignIn page';
  final Auth auth = Auth();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
  );
  Future<void> handleSignIn(String type) async {
    try{
      if(type == 'phone number'){

      }else if(type == 'google'){
          final googleAccount = await _googleSignIn.signIn();
          final googleAuth = await googleAccount?.authentication;
          final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken);
          await auth.signInWithCredential(credential: credential);
          final user = auth.currentUser?.providerData[0];
          if(user != null){
            UserStore.to.saveProfile(user: user);
            Get.offAllNamed('/message');
          }
      }else{

      }
    }catch(e){
      if (kDebugMode) {
        e.printError();
      }
    }
  }
  asyncPostAllData(){

  }
  @override
  void onReady() {
    super.onReady();
  }
}