import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/pages/sign_in/state.dart';
class SignInController extends GetxController{
  SignInController();
  final title = 'SignIn page';
  final state = SignInState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'openid'
    ]
  );
  Future<void> handleSignIn(String type) async {
    try{
      if(type == 'phone number'){

      }else if(type == 'google'){
          var user = await _googleSignIn.signIn();
          if(user != null){
            String? displayName = user.displayName;
            String email = user.email;
            String id = user.id;
            String photoUrl = user.photoUrl??"assets/icons/google.png";
            print(displayName);
          }
      }else{

      }
    }catch(e){
      if (kDebugMode) {
        e.printError();
      }
    }
  }
  @override
  void onReady() {
    super.onReady();
  }
}