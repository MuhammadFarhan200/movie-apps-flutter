import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/models/movie-model.dart';

import '../../../providers/dio-helper.dart';
import '../../../providers/movies-repository.dart';

class DetailController extends GetxController {
  DetailController({required this.movieId});

  late final String movieId;
  RxBool isAwaitDetailMovie = false.obs;
  Rx<MovieModel> detailMovie = MovieModel(
    id: '',
    judul: '',
    sinopsis: '',
    background: '',
    cover: '',
    durasi: '',
    tahunRilis: '',
    genreFilm: '',
  ).obs;

  Future<void> getDetailMovie({
    required String id,
    bool isLoading = true,
  }) async {
    if (isLoading) isAwaitDetailMovie.value = true;

    final result = await ApiClient().getData(ApiConst.path + '/${id}');
  }

  @override
  Future<void> onInit() async {
    await getDetailMovie(id: movieId);
    super.onInit();
  }
}
