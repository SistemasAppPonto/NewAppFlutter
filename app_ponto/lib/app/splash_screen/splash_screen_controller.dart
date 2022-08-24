import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreenController extends GetxController {

  openLogin() {
    Modular.to.navigate('/login');
  }
}
