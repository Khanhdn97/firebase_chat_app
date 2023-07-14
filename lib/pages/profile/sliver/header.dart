import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:login_firebase/components/theme_switcher.dart';
import 'package:login_firebase/pages/profile/controller.dart';
import 'package:login_firebase/theme/theme.dart';

class SliverHeader extends GetView<ProfileController> {
  const SliverHeader({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfo userInfo = controller.profile;
    return SliverPersistentHeader(
      delegate: ProfileHeaderDelegate(
          minExtend: 60, maxExtend: 200, userInfo: userInfo),
      pinned: true,
    );
  }
}

class ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  ProfileHeaderDelegate(
      {required this.minExtend,
      required this.maxExtend,
      required this.userInfo});

  final double minExtend;
  final double maxExtend;
  final UserInfo userInfo;

  Widget _buildProfileImage({required double shrinkOffset, String? imageURL}) {
    return disapearWhenScrollDown(
      child: Container(
          clipBehavior: Clip.none,
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white, width: 7)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageURL!),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 1))
                          ]),
                      child: const Image(
                          image: AssetImage('assets/icons/edit.png'))),
                ),
              ),
            ],
          )),
      shrinkOffset: shrinkOffset,
    );
  }

  Widget _buildProfileAppbar (
      {String? displayName, required double shrinkOffset}) {
    double scrollOpacity = shrinkOffset < 130 ? 0 : shrinkOffset / (maxExtend);
    return AppBar(
        actions: [
          themeSwitcher()
        ],
        title: SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$displayName',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white.withOpacity(scrollOpacity),
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(Icons.settings),
                ),
              ],
            )),
        backgroundColor: Colors.green.withOpacity(scrollOpacity),
        elevation: 0);
  }

  Widget _buildDisplayName(
      {String? displayName, required double shrinkOffset}) {
    return disapearWhenScrollDown(
      child: FractionalTranslation(
        translation: const Offset(-0.5, 0),
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Text(
            textAlign: TextAlign.center,
            '$displayName',
            style: const TextStyle(
              height: 0.9,
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      shrinkOffset: shrinkOffset,
    );
  }

  Widget disapearWhenScrollDown(
      {required double shrinkOffset, required Widget child}) {
    double scrollOpacity =
        shrinkOffset > 130 ? 1 - shrinkOffset / maxExtend : 1;
    return Opacity(opacity: scrollOpacity, child: child);
  }

  ImageProvider<NetworkImage> _backgroundImage() {
    return const NetworkImage(
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg');
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: _backgroundImage(), fit: BoxFit.cover)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildProfileAppbar(
              displayName: userInfo.displayName, shrinkOffset: shrinkOffset),
          Positioned(
              left: MediaQuery.of(context).size.width / 2,
              bottom: -65,
              child: _buildDisplayName(
                  displayName: userInfo.displayName,
                  shrinkOffset: shrinkOffset)),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 60,
              bottom: -30,
              child: _buildProfileImage(
                  imageURL: userInfo.photoURL.toString(),
                  shrinkOffset: shrinkOffset)),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExtend;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
