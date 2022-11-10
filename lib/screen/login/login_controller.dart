import 'package:blog/base/base_controller.dart';
import 'package:blog/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  bool isPasswordError = false;
  bool isError = false;
  bool isErrorEmailLogin = false;
  bool isErrorPasswordLogin = false;
  bool isObscurePasswordLogin = true;
  bool isRemember = false;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final usernameLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();

  @override
  void dispose() {
    usernameLoginController.dispose();
    passwordLoginController.dispose();
    super.dispose();
  }



  Future doLogin(String username, String password) async {
    try {
      await repository
          .login(username, password)
          .then((data) => storage.saveToken(data.data?.token ?? '-')).then((_) => Get.showSnackbar(
        const GetSnackBar(
          message: 'Login berhasil',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ),
      ),).then((_) => Get.offAll(() => const HomeScreen()));
    } catch (e) {
      if (e.toString().contains('Username tidak ditemukan')) {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Username tidak ditemukan, harap daftar terlebih dahulu',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        return e;
      }
    }
  }
}
