import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/pages/profile/controller.dart';

class SliverBody extends GetView<ProfileController> {
  const SliverBody({super.key});
  Widget _buildInfomationForm() {
    UserInfo userInfo = controller.profile;
    final _formKey = GlobalKey<FormState>();
    TextEditingController userNameControl = TextEditingController(text: userInfo.displayName);
    TextEditingController uidControl = TextEditingController(text: userInfo.uid);
    TextEditingController emailControl = TextEditingController(text: userInfo.email);
    TextEditingController phoneNumberControl = TextEditingController(text: userInfo.phoneNumber);
    const double iconSize = 40;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Divider(thickness: 3),
            TextFormField(
              controller: userNameControl,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    enabled: true,
                    fillColor: Colors.green,
                    icon: Icon(
                      Icons.person,
                      size: iconSize,
                    ),
                    hintText: 'Edit your user name?',
                    labelText: 'User Display Name',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            TextFormField(
                controller: uidControl,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    enabled: false,
                    fillColor: Colors.green,
                    icon: Icon(
                      Icons.numbers,
                      size: iconSize,
                    ),
                    hintText: 'Edit your user name?',
                    labelText: 'UID',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            TextFormField(

                controller: emailControl,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    enabled: false,
                    fillColor: Colors.green,
                    icon: Icon(
                      Icons.email,
                      size: iconSize,
                    ),
                    hintText: 'Edit your user name?',
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            TextFormField(

                controller: phoneNumberControl,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    enabled: false,
                    fillColor: Colors.green,
                    icon: Icon(
                      Icons.phone,
                      size: iconSize,
                    ),
                    hintText: 'Edit your user name?',
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            TextFormField(
                initialValue: userInfo.providerId,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    enabled: false,
                    fillColor: Colors.green,
                    icon: Icon(
                      Icons.link,
                      size: iconSize,
                    ),
                    hintText: 'Edit your user name?',
                    labelText: 'Provider Id',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
          ],
        ));
  }
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Personal Infomation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start),
            _buildInfomationForm(),
          ],
        ),
      ),
    );
  }
}


