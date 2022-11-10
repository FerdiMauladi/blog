import 'dart:async';
import 'package:blog/data/model/login_model.dart';
import 'package:blog/data/network_core.dart';
import 'package:blog/data/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  Future<LoginModel> login(String username, String password) async {
    try {
      Response response = await network.dio.post(
        '/login',
        data: {
          'username': username,
          'password': password,
        },
      );
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Username tidak ditemukan');
      }
      throw Exception(e.message);
    }
  }

  @override
  Future register(
      {required String email, required String password, required String name, required String username}) async {
    try {
      final response = await network.dio.post('/register', data: {
        'name' : name,
        'username' : username,
        'email' : email,
        'password' : password,
      });
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
