import 'package:app_ponto/app/shared/utils/AppPalette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(color: AppPalette.primaria)
      // textTheme: _textTheme(),
      // primarySwatch: Colors.blue,
      // scaffoldBackgroundColor: Color(0xFFF5F6F6),
      // dividerColor: Colors.transparent,
      // inputDecorationTheme: InputDecorationTheme(
      //   border: const OutlineInputBorder(),
      // ),
    );
  }

  // TextTheme _textTheme() {
  //   return TextTheme();
  // }
}
