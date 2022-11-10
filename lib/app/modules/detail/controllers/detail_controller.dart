import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/models/movie-model.dart';

import '../../../providers/dio-helper.dart';
import '../../../providers/movies-repository.dart';

class DetailController extends GetxController {
  int movieId = Get.arguments[0];
  final movieApi = ApiClient();

  bool isLoading = true;
  List<MovieModel> movieData = [
    MovieModel(
      id: '',
      judul: '',
      sinopsis: '',
      background: '',
      cover: '',
      durasi: '',
      tahunRilis: '',
      genreFilm: '',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    fetchMovieDetails();
  }

  void fetchMovieDetails() async {
    var response = await movieApi.getMovieDetails(movieId: movieId);
    if (response.statusCode == 200) {
      movieData.add(MovieModel.fromMap(response));
      isLoading = false;
      update();
    }
  }
}
