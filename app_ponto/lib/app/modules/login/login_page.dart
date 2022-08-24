import 'package:app_ponto/app/modules/login/login_controller.dart';
import 'package:app_ponto/app/shared/utils/AppPalette.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: AppPalette.primaria,
            body: Container(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  const SizedBox(height: 40),
                  Text(
                    "App Ponto",
                    style: TextStyle(
                        color: AppPalette.branco,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Faça login em sua sua conta usando \ncpf e senha.",
                    style: TextStyle(color: AppPalette.white70),
                  ),
                  const SizedBox(height: 20),
                  _form(_, context),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Esqueceu sua senha?",
                        style: TextStyle(
                            color: AppPalette.white70,
                            fontStyle: FontStyle.italic),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Recuperar senha",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  SizedBox _form(LoginController _, BuildContext context) {
    return SizedBox(
      height: 210,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 24, right: 8, top: 8, bottom: 56),
              decoration: BoxDecoration(
                color: AppPalette.branco,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text("cpf"), hintText: "000.000.000-00"),
                        ),
                        TextFormField(
                          obscureText: _.showPassword,
                          decoration: InputDecoration(
                            label: const Text("senha"),
                            suffixIcon: IconButton(
                              icon: Icon(_.showPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              onPressed: _.setPassword,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 2.5,
                child: ElevatedButton(
                  child: const Text("Entrar"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _.openResetPassword,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
