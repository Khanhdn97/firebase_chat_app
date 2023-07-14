import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/firebase_options.dart';
import 'package:login_firebase/pages/message/import.dart';
import 'package:login_firebase/pages/profile/import.dart';
import 'package:login_firebase/services/storage.dart';
import 'package:login_firebase/store/user.dart';
import 'package:login_firebase/theme/theme.dart';
import 'pages/sign_in/import.dart';
import 'pages/welcome/import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put<StorageServices>(StorageServices());
  Get.put<UserStore>(UserStore());
  Get.put<ThemeManager>(ThemeManager());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeManager.to.themeMode,
      title: 'Chat app',
      initialRoute: '/',
      initialBinding: WelcomeBinding(),
      getPages: [
        GetPage(name: '/', page: () => const WelcomePage()),
        GetPage(
            name: '/signing',
            page: () => const SignInPage(),
            binding: SignInBinding(),
            middlewares: []
        ),
        GetPage(
            name: '/message',
            page: () => const MessagePage(),
            binding: MessageBinding()),
        GetPage(
            name: '/profile',
            page: () => const ProfilePage(),
            binding: ProfileBinding())
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
