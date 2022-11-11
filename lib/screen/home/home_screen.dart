import 'package:blog/screen/home/home_controller.dart';
import 'package:blog/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        if (controller.state == HomeViewState.loading) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        }
        if (controller.state == HomeViewState.tokenExpired) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  controller.getDataPost().then(
                    (data) {
                      if (controller.state == HomeViewState.tokenExpired) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 5,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.clear_sharp,
                                  color: Colors.red,
                                  size: 80,
                                ),
                              ),
                              content: const Text(
                                'Your session has expired, please login again',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => controller.logout().then(
                                    (_) {
                                      Get.offAll(() => const LoginScreen());
                                    },
                                  ),
                                  child: const Text(
                                    'Login Again',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 10, // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: ListView.builder(
            itemCount: controller.listPostBlog.length,
            itemBuilder: (context, index) {
              print(controller.listPostBlog.length);
              return Text(
                controller.listPostBlog[index].content ?? '-',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 36,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
