import 'dart:async';
import 'package:blog/base/base_controller.dart';
import 'package:blog/screen/home/home_screen.dart';
import 'package:blog/screen/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      if (storage.readToken() != null) {
        Get.offAll(() => const HomeScreen());
      }
      else {
        Get.offAll(const LoginScreen());
      }
    });
    super.onInit();
  }
}