import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData themeLight = ThemeData(brightness: Brightness.light);

ThemeData themeDark = ThemeData(brightness: Brightness.dark);

class ThemeManager extends GetxController{
  static ThemeManager get to => Get.find();
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;
  get isThemeDark => (_themeMode == ThemeMode.dark);
  toggleTheme(bool isDark){
    _themeMode = isDark? ThemeMode.dark: ThemeMode.light;
    Get.changeThemeMode(isDark? ThemeMode.dark: ThemeMode.light);
    Get.forceAppUpdate();
  }
}