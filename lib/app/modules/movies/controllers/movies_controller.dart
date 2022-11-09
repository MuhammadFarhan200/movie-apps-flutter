import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/models/movie-model.dart';
import 'package:movie_apps_flutter/app/providers/dio-helper.dart';
import 'package:movie_apps_flutter/app/providers/movies-repository.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = ''.obs;
  var moviesData = <MovieModel>[].obs;

  Dio dio = Dio();

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<MovieModel>> getUser() async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.path);
      final List data = result['data'];
      isLoading(false);
      isError(false);
      moviesData.value = data.map((e) => MovieModel.fromMap(e)).toList();
      return moviesData;
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }
}
