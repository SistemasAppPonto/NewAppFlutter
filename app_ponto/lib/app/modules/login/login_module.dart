import 'package:app_ponto/app/modules/login/login_controller.dart';
import 'package:app_ponto/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends  Module{

  @override
  List<Module> get imports => const [];

  @override
  void binds(i) {
    i.add(LoginController.new);
  }

  @override
  void routes(r){
   r.child('/', child: (context) => const LoginPage(),  transition: TransitionType.leftToRight);
  }
}
