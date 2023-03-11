import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/providers/dio_helper.dart';
import 'package:http/http.dart' as http;

class MoviesController extends GetxController {
  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = ''.obs;
  var movieList = [].obs;

  @override
  void onInit() {
    getMovie();
    super.onInit();
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
}
