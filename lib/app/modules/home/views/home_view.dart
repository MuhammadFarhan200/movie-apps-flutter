import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/models/movie-model.dart';
import 'package:movie_apps_flutter/app/modules/detail/controllers/detail_controller.dart';
import 'package:movie_apps_flutter/app/modules/detail/views/detail_view.dart';
import 'package:movie_apps_flutter/app/modules/movies/controllers/movies_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final movieC = Get.put(MovieController());
    final List<String> imageSliders = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Image(
          height: 80,
          image: AssetImage('assets/images/movie-apps-logo-no-bg.png'),
        ),
        centerTitle: false,
        actions: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              child: Text(
                controller.name.value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          child: Obx(
            () {
              if (movieC.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (movieC.isError.value) {
                return Text(
                  "Error: ${movieC.errmsg.value.capitalize}",
                );
              } else {}
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        height: Get.height * 0.30,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                      ),
                      items: imageSliders
                          .map((e) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(e),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: controller.movies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailView(movie: controller.movies[index]));
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: const NetworkImage(
                                    'https://occ-0-2430-2433.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABboRq3GJ0wSZ0FqeK1EwuUPH5iTCEWqF37LyvXO1Z-XBAht4LA4ggwfnfKAhMXtz-wUmGmo9GM7Hhk9_Ily1BMiNtqyao0zVPo3NKR320IuCHkQxey591Rbyu2zB3g.jpg'),
                                fit: BoxFit.cover,
                                height: Get.height * 0.30,
                                width: Get.width * 0.95,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  controller.movies[index].judul,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
