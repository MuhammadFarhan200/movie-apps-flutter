import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movie_apps_flutter/app/providers/api.dart';
import 'package:movie_apps_flutter/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController(text: 'admin@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'rahasia');

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final isLoading = false.obs;

  void login() async {
    isLoading.value = !isLoading.value;
    var data = {'email': emailController.text, 'password': passwordController.text};

    var res = await NetWork().auth(data, '/login');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      // ignore: use_build_context_synchronously
      // Get.offAllNamed(Routes.HOME);
      Get.offAllNamed(Routes.BOTTOM_NAV);
    } else {
      Get.snackbar(
        'OOPS!',
        body['message'],
        margin: const EdgeInsets.all(20),
        animationDuration: const Duration(milliseconds: 300),
      );
      isLoading.value = !isLoading.value;
    }
  }
}
