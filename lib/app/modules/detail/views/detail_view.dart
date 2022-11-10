import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/models/movie-model.dart';
import 'package:movie_apps_flutter/app/modules/home/controllers/home_controller.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;
  final HomeController homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(CupertinoIcons.back),
                ),
              ),
              expandedHeight: Get.height / 1.8,
              floating: true,
              pinned: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image(
                      image: NetworkImage(homeC.imageSliders[movie.id - 1]),
                      // image: const NetworkImage(
                      //   'https://occ-0-2430-2433.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABboRq3GJ0wSZ0FqeK1EwuUPH5iTCEWqF37LyvXO1Z-XBAht4LA4ggwfnfKAhMXtz-wUmGmo9GM7Hhk9_Ily1BMiNtqyao0zVPo3NKR320IuCHkQxey591Rbyu2zB3g.jpg',
                      // ),
                      fit: BoxFit.cover,
                      width: Get.width,
                      height: Get.height,
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
              Text(
                '${movie.judul}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text('${movie.durasi} Menit'),
              const SizedBox(height: 10),
              Text(_parseHtmlString('${movie.sinopsis}')),
            ],
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
