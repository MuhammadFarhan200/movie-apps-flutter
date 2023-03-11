import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:movie_apps_flutter/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../bottom_nav/controllers/bottom_nav_controller.dart';
import '../controllers/movies_controller.dart';

class MoviesView extends GetView<MovieController> {
  MoviesView({Key? key}) : super(key: key);
  final homeC = Get.put(HomeController());
  final bottomNavC = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Movies List'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              homeC.onWillPop();
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Exit',
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () {
              if (controller.isLoading.isTrue) {
                return Shimmer.fromColors(
                  baseColor: const Color.fromARGB(202, 33, 33, 59),
                  highlightColor: const Color.fromARGB(201, 54, 54, 85),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: controller.movieList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                );
              } else if (controller.isError.value) {
                return Center(
                  child: Text(
                    "Error: ${controller.errmsg.value.capitalize}",
                  ),
                );
              } else {}
              return GridView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                ),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                        // ignore: sort_child_properties_last
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                          fit: BoxFit.cover,
                        ),
                        footer: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.black.withOpacity(0.7),
                          child: Center(
                            child: Text(
                              movie['title'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
