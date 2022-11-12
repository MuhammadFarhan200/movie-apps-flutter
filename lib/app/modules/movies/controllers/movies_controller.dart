import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/models/movie_model.dart';
import 'package:movie_apps_flutter/app/providers/dio_helper.dart';
import 'package:movie_apps_flutter/app/providers/movies_repository.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = ''.obs;
  var moviesData = <MovieModel>[].obs;

  Dio dio = Dio();

  @override
  void onInit() {
    getMovie();
    super.onInit();
  }

  Future<List<MovieModel>> getMovie() async {
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
