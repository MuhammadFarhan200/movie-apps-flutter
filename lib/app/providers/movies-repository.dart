import 'package:dio/dio.dart';
import 'package:movie_apps_flutter/app/providers/dio-helper.dart';

class ApiClient {
  Future getData(String path) async {
    try {
      final resonse = await Dio(
        BaseOptions(baseUrl: ApiConst.baseUrl),
      ).get(path);
      return resonse.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  final dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));
  Future<dynamic> getMovieDetails({required int movieId}) async {
    final response = await dio.get('/movies/$movieId');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}