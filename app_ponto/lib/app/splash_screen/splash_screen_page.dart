import 'package:app_ponto/app/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final _controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const  Center(
        child: Text("Splash"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.openLogin,
      ),
    );
  }
}
