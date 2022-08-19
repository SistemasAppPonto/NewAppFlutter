import 'package:app_ponto/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("login"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _controller.opneHome,
        ));
  }
}
