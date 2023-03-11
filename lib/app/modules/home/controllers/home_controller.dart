import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/providers/dio_helper.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var movieList = [].obs;
  var isError = false.obs;
  var errmsg = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMovie();
  }

  void getMovie() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('${ApiConst.baseUrl}/popular?api_key=${ApiConst.apiKey}'));
      if (response.statusCode == 200) {
        var movieJson = jsonDecode(response.body)['results'];
        for (var movie in movieJson) {
          movieList.add(movie);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }

  void onWillPop() async {
    return await Get.generalDialog(
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 15, 15, 29),
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App', style: TextStyle(fontSize: 16, color: Colors.white)),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith((states) => const Color.fromARGB(43, 186, 201, 254)),
                ),
                child: const Text('No', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith((states) => const Color.fromARGB(43, 254, 186, 186)),
                ),
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Color.fromARGB(255, 254, 137, 137)),
                ),
              ),
            ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }
}
