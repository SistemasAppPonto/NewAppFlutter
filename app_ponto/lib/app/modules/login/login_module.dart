import 'package:app_ponto/app/modules/login/login_controller.dart';
import 'package:app_ponto/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends  Module{

  @override
  List<Module> get imports => const [];

  @override
  List<Bind> get binds => [
    Bind.factory((i) => LoginController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => const LoginPage(),  transition: TransitionType.leftToRight),
  ];
}
