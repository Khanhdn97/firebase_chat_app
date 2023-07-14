import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithCredential(
      {required AuthCredential credential}) async {
    await _firebaseAuth.signInWithCredential(credential);
  }
  Future<void> signInWithPhoneNumber() async{
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+84388482643',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) async {
        print('phone Credential: $phoneAuthCredential');
      },
      verificationFailed: (error) {
        print(error.code);
      },
      codeSent: (verificationId, forceResendingToken) {
        String smsCode = '123456';
        print('VerID: $verificationId, forceResendingToken: $forceResendingToken');
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print(verificationId);
      },);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
