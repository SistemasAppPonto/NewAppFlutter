import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  var cpf = 0.obs;
  var password = 0.obs;

  doLogin() {}

  opneHome(){
    Modular.to.navigate('/home');
  }
}
