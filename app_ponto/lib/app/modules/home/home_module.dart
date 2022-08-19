
import 'package:app_ponto/app/modules/home/home_controller.dart';
import 'package:app_ponto/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{

  @override
  List<Module> get imports => const [];

  @override
  List<Bind> get binds => [
    Bind.factory((i) => HomeController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}