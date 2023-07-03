
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/sign_in/index.dart';
import 'pages/welcome/index.dart';
void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      title: 'Chat app',
      initialRoute: '/',
      initialBinding: WelcomeBinding(),
      getPages: [GetPage(name: '/', page: ()=> const WelcomePage()),GetPage(name: '/message', page: () => const SignInPage(),binding: SignInBinding())],

      debugShowCheckedModeBanner: false,
    );
  }
}
