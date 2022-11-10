import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/models/movie-model.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.judul),
        centerTitle: false,
        leading: SizedBox(
          width: 50,
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.back),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Judul: ${movie.judul}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
