import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/pages/welcome/controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.greenAccent),
        child: Text(
          controller.title,
          style: const TextStyle(fontSize: 45, color: Colors.black54,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
