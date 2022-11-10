import 'package:blog/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  bool isPasswordError = false;
  bool isError = false;
  bool isErrorPasswordRegister = false;
  bool isErrorConfirmRegister = false;
  bool isObscurePasswordRegister = true;
  bool isObscureConfirmPasswordRegister = true;
  bool isLoading = false;

  final formKeyRegister = GlobalKey<FormState>();

  final namaRegisterController = TextEditingController();
  final usernameRegisterController = TextEditingController();
  final emailRegisterController = TextEditingController();
  final passwordRegisterController = TextEditingController();
  final confirmPasswordRegisterController = TextEditingController();

  @override
  void dispose() {
    namaRegisterController.dispose();
    emailRegisterController.dispose();
    passwordRegisterController.dispose();
    confirmPasswordRegisterController.dispose();
    super.dispose();
  }

  Future doRegister(
      {required String username,
      required String name,
      required String email,
      required String password}) async {
    try {
      await repository.register(name: name, username: username, email: email, password: password);
    } catch (e) {
      // if (e.toString().contains('Username tidak ditemukan')) {
      //   Get.showSnackbar(
      //     const GetSnackBar(
      //       message: 'Username tidak ditemukan, harap daftar terlebih dahulu',
      //       isDismissible: true,
      //       duration: Duration(seconds: 3),
      //       backgroundColor: Colors.red,
      //     ),
      //   );
      // } else {
      return e;
      // }
    }
  }
}
