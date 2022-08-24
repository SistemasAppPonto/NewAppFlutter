import 'dart:async';

import 'package:app_ponto/app/shared/utils/AppPalette.dart';
import 'package:app_ponto/app/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  navigateToLogin() async {
    return Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.primaria,
      body: Center(
        child: Icon(
          Icons.fingerprint,
          size: MediaQuery.of(context).size.width / 3,
          color: AppPalette.branco,
        ),
      ),
    );
  }
}
