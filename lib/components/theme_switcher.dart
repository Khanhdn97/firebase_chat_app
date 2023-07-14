import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

Widget themeSwitcher (){
  return Switch(
    value: ThemeManager.to.isThemeDark,
    onChanged: (value) {
      ThemeManager.to.toggleTheme(value);
    },
  );
}