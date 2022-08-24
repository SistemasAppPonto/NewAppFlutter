import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  bool showPassword = true;
  String cpf = "";
  String password = "";

  setPassword() {
    showPassword = !showPassword;
    update();
  }

  doLogin() {

  }

  openHome() {
    Modular.to.navigate('/home');
  }

  openResetPassword(){
    openHome();
  }
}
