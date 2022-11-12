import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/models/movie_model.dart';
import 'package:movie_apps_flutter/app/modules/home/controllers/home_controller.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;
  final HomeController homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 11, 11, 20),
                leading: SizedBox(
                  width: 50,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(CupertinoIcons.back),
                  ),
                ),
                expandedHeight: Get.height * 0.40,
                floating: false,
                pinned: true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(top: 0, bottom: 15, left: 15, right: 15),
                  expandedTitleScale: 1.2,
                  centerTitle: true,
                  title: Text(
                    movie.judul,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  background: Stack(
                    children: [
                      Image(
                        image: AssetImage(homeC.imageSliders[movie.id - 1]),
                        fit: BoxFit.cover,
                        width: Get.width,
                        height: Get.height,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  collapseMode: CollapseMode.parallax,
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text('${movie.durasi} Menit'),
                const SizedBox(height: 10),
                Text(_parseHtmlString(movie.sinopsis)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body?.text).documentElement!.text;

  return parsedString;
}
