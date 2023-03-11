import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../routes/app_pages.dart';
import '../../bottom_nav/controllers/bottom_nav_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final bottomNavC = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text(' Movie Apps'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              controller.onWillPop();
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Exit',
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          child: Obx(
            () {
              if (controller.isLoading.isTrue) {
                return Shimmer.fromColors(
                  baseColor: const Color.fromARGB(202, 33, 33, 59),
                  highlightColor: const Color.fromARGB(201, 54, 54, 85),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    itemCount: controller.movieList.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      height: Get.height * 0.30,
                    ),
                  ),
                );
              } else if (controller.isError.value) {
                return Center(
                  child: Text(
                    "Error: ${controller.errmsg.value.capitalize}",
                  ),
                );
              } else {}
              return Column(
                children: [
                  const SizedBox(height: 15),
                  const Text('Top Movie', style: TextStyle(fontSize: 22)),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        autoPlay: true,
                        initialPage: 1,
                        height: Get.height * 0.30,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                      ),
                      items: controller.movieList
                          .map(
                            (e) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage('https://image.tmdb.org/t/p/w500${e['backdrop_path']}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Latest Update', style: TextStyle(fontSize: 22)),
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: controller.movieList.length,
                    itemBuilder: (context, index) {
                      final movie = controller.movieList[index]; 
                      return ZoomTapAnimation(
                        begin: 1.0,
                        end: 0.95,
                        beginDuration: const Duration(milliseconds: 100),
                        endDuration: const Duration(milliseconds: 100),
                        onTap: () {
                          Get.toNamed(Routes.DETAIL, arguments: movie);
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: NetworkImage('https://image.tmdb.org/t/p/w500${movie['backdrop_path']}'),
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
                                      Colors.black.withOpacity(0.8),
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
                                  movie['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(CupertinoIcons.time, size: 20),
                                    const SizedBox(width: 10),
                                    Text(
                                      movie['release_date'],
                                    ),
                                  ],
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
