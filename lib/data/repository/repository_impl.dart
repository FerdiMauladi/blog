import 'dart:async';
import 'package:blog/data/model/login_model.dart';
import 'package:blog/data/model/post_model.dart';
import 'package:blog/data/network_core.dart';
import 'package:blog/data/repository/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

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

  @override
  Future<PostModel> deletePostId(String token, String id) {
    // TODO: implement deletePostId
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPost() async {
    try {
      String? token = await storageSecure.read(key: 'token');
      network.dio.options.headers["Authorization"] = 'Bearer $token';
      var response = await network.dio.get('/post');
      List<dynamic> listData = response.data['data'];
      List<PostModel> listPost = listData.map((post) => PostModel.fromJson(post)).toList();

      return listPost;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Token Expired');
      }
      throw Exception(e.message);
    }
  }

  @override
  Future<PostModel> getPostId(String token, String id) async {
    try {
      network.dio.options.headers["Authorization"] = 'Bearer $token';
      var response = await network.dio.get('/post/$id');
      var post = response.data;
      return PostModel.fromJson(post);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future logout() async {
    try {
      final response = await network.dio.post('/logout');
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<PostModel> postBlog({required PostModel postModel, required String token}) {
    // TODO: implement postBlog
    throw UnimplementedError();
  }

  @override
  Future<PostModel> updateBlog({required PostModel postModel, required String token, required String id}) {
    // TODO: implement updateBlog
    throw UnimplementedError();
  }
}
