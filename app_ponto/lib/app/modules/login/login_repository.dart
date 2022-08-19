import 'dart:ffi';

import 'package:app_ponto/app/shared/custom_dio/custom_dio.dart';
import 'package:app_ponto/app/shared/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginRepository extends Disposable {
  final CustomDio _dio;

  LoginRepository(this._dio);

  Future doLogin(UserModel userModel) async {
    Response response = await _dio.client.post('???????', data: userModel);
    return response;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
