import 'package:flutter/material.dart';

import '../helper/constans.dart';

ThemeData getThemeData() {
  return ThemeData(
      colorScheme: const ColorScheme(
          onBackground: Colors.transparent,
          onError: Colors.red,
          error: Colors.red,
          brightness: Brightness.light,
          background: Colors.transparent,
          onPrimary: Color(0xff),
          onSecondary: Color(0xff),
          onSurface: Color(0xff),
          primary: primaryColor,
          secondary: Color(0xff),
          surface: Color(0xff)),
      inputDecorationTheme:const InputDecorationTheme(
        enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
          focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      )));
}
