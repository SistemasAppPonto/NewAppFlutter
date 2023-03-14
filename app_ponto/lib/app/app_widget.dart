
import 'package:app_ponto/app/shared/styles/app_theme.dart';
import 'package:app_ponto/app/shared/utils/AppPalette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  // static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App Ponto',
      theme: ThemeData(
        scaffoldBackgroundColor: AppPalette.beckground,
        appBarTheme: AppBarTheme(color: AppPalette.primaria)
      ),

      // key: navigatorKey,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added this
  }
}
