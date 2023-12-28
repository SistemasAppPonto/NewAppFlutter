import 'package:app_ponto/app/modules/home/home_module.dart';
import 'package:app_ponto/app/modules/login/login_module.dart';
import 'package:app_ponto/app/splash_screen/splash_screen_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  void binds(i) {}

  @override
  void routes(r){
       r.add(ModuleRoute(Modular.initialRoute, module: SplashScreenModule()));
        r.add(ModuleRoute('/login', module: LoginModule()));
        r.add(ModuleRoute('/home', module: HomeModule()));
      }
}
