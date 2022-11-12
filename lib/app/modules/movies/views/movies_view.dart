import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/controllers/bottom_nav_controller.dart';
import 'package:movie_apps_flutter/app/modules/detail/bindings/detail_binding.dart';
import 'package:movie_apps_flutter/app/modules/detail/views/detail_view.dart';
import 'package:movie_apps_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:movie_apps_flutter/app/modules/profile/controllers/profile_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/movies_controller.dart';

class MoviesView extends StatelessWidget {
  MoviesView({Key? key}) : super(key: key);
  final movieC = Get.put(MovieController());
  final homeC = Get.put(HomeController());
  final profileC = Get.put(ProfileController());
  final bottomNavC = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Daftar Movie'),
        centerTitle: false,
        actions: [
          PopupMenuButton(
            color: const Color.fromARGB(255, 23, 23, 43),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Obx(() => Text(homeC.name.value)),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () {
              if (movieC.isLoading.isTrue) {
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
                    itemCount: movieC.moviesData.length,
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
              } else if (movieC.isError.value) {
                return Center(
                  child: Text(
                    "Error: ${movieC.errmsg.value.capitalize}",
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
                itemCount: movieC.moviesData.length,
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    begin: 1.0,
                    end: 0.9,
                    beginDuration: const Duration(milliseconds: 100),
                    endDuration: const Duration(milliseconds: 100),
                    onTap: () {
                      Get.to(() => DetailView(movie: movieC.moviesData[index]),
                          binding: DetailBinding());
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                        // ignore: sort_child_properties_last
                        child: Image.asset(
                          homeC.imageSliders[movieC.moviesData[index].id - 1],
                          fit: BoxFit.cover,
                        ),
                        footer: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.black.withOpacity(0.7),
                          child: Center(
                            child: Text(
                              movieC.moviesData[index].judul,
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
