import 'dart:async';

import 'package:movie_apps_flutter/app/routes/app_pages.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationInitilization();
    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed(Routes.LOGIN),
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
  }
}
