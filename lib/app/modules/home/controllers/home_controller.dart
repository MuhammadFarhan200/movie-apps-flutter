import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/providers/dio_helper.dart';
import 'package:movie_apps_flutter/app/providers/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/movie_model.dart';

class HomeController extends GetxController {
  final movieApi = ApiClient();
  var movies = <MovieModel>[].obs;
  final isLoading = true.obs;
  var isError = false.obs;
  var errmsg = ''.obs;
  final List<String> imageSliders = [
    'assets/images/ali-ratu-ratu-queens.jpg',
    'assets/images/spider-man-no-way-home.jpg',
    'assets/images/spider-man-far-from-home.jpg',
    ];

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    fetchUpcomingMovies();
  }

  Future<List<MovieModel>> fetchUpcomingMovies() async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.path);
      final List data = result['data'];
      isLoading(false);
      isError(false);
      movies.value = data.map((e) => MovieModel.fromMap(e)).toList();
      return movies;
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }

  final name = ''.obs;
  final email = ''.obs;

  void loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') ?? '');

    if (user != null) {
      name.value = user['name'];
      email.value = user['email'];
    }
  }
}
