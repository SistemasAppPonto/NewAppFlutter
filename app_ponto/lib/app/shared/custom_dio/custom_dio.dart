import 'package:dio/dio.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    // if (DEBUG)
    //   client.options.baseUrl = BASE_URL;
    // else
    //   client.options.baseUrl = BASE_URL;
    // client.options.extra["refresh"] = true;
    // client.interceptors.add(CustomInterceptors());
  }
}
