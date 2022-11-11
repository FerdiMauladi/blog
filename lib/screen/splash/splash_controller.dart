import 'dart:async';
import 'package:blog/base/base_controller.dart';
import 'package:blog/screen/home/home_screen.dart';
import 'package:blog/screen/login/login_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  final storageSecure = const FlutterSecureStorage();
  String? token;
  @override
  void onInit() {
    getToken();
    Timer(const Duration(seconds: 3), () {
      if (token != null) {
        Get.offAll(() => const HomeScreen());
      }
      else {
        Get.offAll(const LoginScreen());
      }
    });
    super.onInit();
  }

  void getToken() async {
    token = await storageSecure.read(key: 'token');
    update();
  }
}