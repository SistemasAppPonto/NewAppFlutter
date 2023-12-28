import 'package:app_ponto/app/modules/home/home_controller.dart';
import 'package:app_ponto/app/modules/home/home_page.dart';
import 'package:app_ponto/app/modules/home/pages/camera/camera_page.dart';
import 'package:app_ponto/app/modules/home/pages/point_register/point_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  void binds(i){
    i.add(HomeController.new);
  }

  @override
  void routes(r){
    r.child('/', child: (context) => HomePage(),);
    r.child('/point_register', child: (context) => PointRegisterPage(),);
    r.child('/camera', child: (context) => CameraPage(),);
  } 
}
