import 'package:app_ponto/app/splash_screen/splash_screen_controller.dart';
import 'package:app_ponto/app/splash_screen/splash_screen_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  void binds(i){
        i.add(SplashScreenController.new);
      }

  @override
  void routes(r){
        r.child('/', child: (context) => SplashScreenPage());
      }
}
