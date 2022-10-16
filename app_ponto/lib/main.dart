import 'package:app_ponto/app/app_module.dart';
import 'package:app_ponto/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  initializeDateFormatting().then(
    (_) => runApp(
      ModularApp(module: AppModule(), child: AppWidget()),
    ),
  );
}
