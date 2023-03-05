import 'package:app_ponto/app/app_module.dart';
import 'package:app_ponto/app/app_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  initializeDateFormatting().then(
    (_) => runApp(
      ModularApp(module: AppModule(), child: AppWidget()),
    ),
  );
}
