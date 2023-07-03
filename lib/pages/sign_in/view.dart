import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
        child: Text(
      controller.title,
      style: const TextStyle(
          fontSize: 35, color: Colors.black54, fontWeight: FontWeight.bold),
    ));
  }

  Widget _buildThirdPartyLogin(String loginType) {
    return GestureDetector(
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(3, 5),
              )
            ]),
        child: Row(
          mainAxisAlignment: loginType == 'Phone Number'
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loginType == 'Phone Number'
                ? Container()
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child:
                        Image(image: AssetImage("assets/icons/$loginType.png"))),
            Text(
              'Sign in with ${loginType}',
            )
          ],
        ),
      ),
      onTap: () {
        controller.handleSignIn('google');
      },
    );
  }
  Widget _buildOrWidget(){
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 35),
      child: Row(
        children: const [
          Expanded(
              child: Divider(
                height: 2,
                color: Colors.black26,
                indent: 50,
              )),
          Text(' or '),
          Expanded(
              child: Divider(
                height: 2,
                color: Colors.black26,
                endIndent: 50,
              )),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.tealAccent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              _buildThirdPartyLogin('google'),
              _buildThirdPartyLogin('facebook'),
              _buildThirdPartyLogin('apple'),
              _buildOrWidget(),
              _buildThirdPartyLogin('Phone Number'),
              const SizedBox(
                height: 30,
              ),
             Column(
                children: const [
                  Text('Already have an account'),
                  Text('Sign up here',style: TextStyle(color: Colors.blue),)
                ],
              )
            ],
          )),
    );
  }
}
