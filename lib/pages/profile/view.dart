import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:login_firebase/pages/profile/sliver/body.dart';
import 'package:login_firebase/pages/profile/sliver/header.dart';

import '../../auth.dart';
import 'controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  Widget _buildLogOutButton() {
    return TextButton(
      onPressed: () {
        Get.defaultDialog(
          title: 'Are you sure to log out?',
          content: const Text('logout'),
          textConfirm: 'Confirm',
          textCancel: 'Cancle',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.offAllNamed('/signing');
          },
        );
      },
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
          fixedSize: MaterialStatePropertyAll(Size(200, 40))),
      child: const Text(
        'Log out',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScrollPhysics scrollPhysics =
        const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      physics: scrollPhysics,
      slivers: [
        SliverHeader(),
        SliverBody(),
        SliverToBoxAdapter(child: _buildLogOutButton(),)
      ],
    )));
  }
}
