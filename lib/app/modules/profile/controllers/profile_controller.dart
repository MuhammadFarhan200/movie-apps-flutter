import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  void logout() async {
    var res = await NetWork().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      // ignore: use_build_context_synchronously
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void confirmLogout() {
    Get.defaultDialog(
      title: 'Confirm',
      middleText: 'Anda yakin akan logout?',
      onConfirm: () => logout(),
      onCancel: () => Get.back(),
      textConfirm: 'Logout',
      textCancel: 'Batal',
      middleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 15, 15, 29),
      contentPadding: const EdgeInsets.only(bottom: 20, top: 20, left: 30, right: 30),
      titlePadding: const EdgeInsets.only(top: 20),
    );
  }
}
