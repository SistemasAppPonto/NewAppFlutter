import 'package:app_ponto/app/app_widget.dart';
import 'package:app_ponto/app/modules/home/home_module.dart';
import 'package:app_ponto/app/modules/login/login_module.dart';
import 'package:app_ponto/app/splash_screen/splash_screen_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashScreenModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
