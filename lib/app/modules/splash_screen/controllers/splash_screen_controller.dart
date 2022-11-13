import 'dart:async';

import 'package:movie_apps_flutter/app/routes/app_pages.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  final isAuth = false.obs;

  @override
  void onInit() {
    super.onInit();
    animationInitilization();
    Timer(
      const Duration(seconds: 3),
      () => checkIfLoggedIn(),
    );
  }

  animationInitilization() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ).obs.value;
    animation.addListener(() => update());
    animationController.forward();
    animationController.removeListener(() { });
  }

  void checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      isAuth.value = true;
      Get.offAllNamed(Routes.STARTPAGE);
    }
    else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
