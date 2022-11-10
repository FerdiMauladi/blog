import 'package:blog/const/app_const.dart';
import 'package:dio/dio.dart';

class NetworkCore {
  Dio dio = Dio();

  NetworkCore() {
    dio.options = BaseOptions(
        baseUrl: AppConst.baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        sendTimeout: 30000,
        headers: {
          'accept' : 'application/json',
        }
    );
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}