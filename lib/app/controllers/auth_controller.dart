import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/providers/api.dart';
import 'package:movie_apps_flutter/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {

  final _secureText = true.obs;
  showHide() {
    return _secureText.value = !_secureText.value;
  }
}
