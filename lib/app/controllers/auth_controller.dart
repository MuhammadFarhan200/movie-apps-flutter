import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/providers/api.dart';
import 'package:movie_apps_flutter/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  void _login() async {

    var email, password;
    var data = {'email': email, 'password': password};

    var res = await NetWork().auth(data, '/login');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      // ignore: use_build_context_synchronously
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar('OOPS!', body['message']);
    }
  }
}
