import 'package:app_ponto/app/splash_screen/splash_screen_controller.dart';
import 'package:app_ponto/app/splash_screen/splash_screen_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  List<Bind> get binds => [
        Bind.factory((i) => SplashScreenController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => SplashScreenPage()),
      ];
}
