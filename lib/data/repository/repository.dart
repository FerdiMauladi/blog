import 'dart:async';

import 'package:blog/data/model/login_model.dart';

abstract class Repository {
  Future<LoginModel> login(String username, String password);
  Future register(
      {required String email, required String password, required String name, required String username});
}