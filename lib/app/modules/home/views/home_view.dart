import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/controllers/bottom_nav_controller.dart';
import 'package:movie_apps_flutter/app/modules/detail/bindings/detail_binding.dart';
import 'package:movie_apps_flutter/app/modules/detail/views/detail_view.dart';
import 'package:movie_apps_flutter/app/modules/movies/controllers/movies_controller.dart';
import 'package:movie_apps_flutter/app/modules/profile/controllers/profile_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final movieC = Get.put(MovieController());
  final profileC = Get.put(ProfileController());
  final bottomNavC = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Image(
          height: 80,
          image: AssetImage('assets/images/movie-apps-logo-no-bg.png'),
        ),
        centerTitle: false,
        actions: [
          PopupMenuButton(
            
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Obx(() => Text(controller.name.value)),
                onTap: () => bottomNavC.changeTabIndex(2),
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text('Logout'),
                  ],
                ),
                onTap: () {
                  Future.delayed(
                    const Duration(seconds: 0),
                    () => profileC.confirmLogout(),
                  );
                },
              )
            ],
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          child: Obx(
            () {
              if (movieC.isLoading.isTrue) {
                return Shimmer.fromColors(
                  baseColor: const Color.fromARGB(202, 33, 33, 59),
                  highlightColor: const Color.fromARGB(201, 54, 54, 85),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    itemCount: controller.movies.length,
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
              } else if (movieC.isError.value) {
                return Center(
                  child: Text(
                    "Error: ${movieC.errmsg.value.capitalize}",
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
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        initialPage: 1,
                        height: Get.height * 0.30,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                      ),
                      items: controller.imageSliders
                          .map(
                            (e) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(e),
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
                    itemCount: controller.movies.length,
                    itemBuilder: (context, index) {
                      return ZoomTapAnimation(
                        begin: 1.0,
                        end: 0.93,
                        beginDuration: const Duration(milliseconds: 100),
                        endDuration: const Duration(milliseconds: 100),
                        onTap: () {
                          Get.to(
                            () => DetailView(movie: controller.movies[index]),
                            binding: DetailBinding(),
                            routeName: '/detail',
                          );
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage(controller.imageSliders[
                                    controller.movies[index].id - 1]),
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
                                  controller.movies[index].judul,
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
                                      '${controller.movies[index].durasi} Menit',
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
