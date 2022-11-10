
import 'package:blog/screen/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Lottie.asset(
              "assets/lottie/blog.json",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
