import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/controllers/bottom_nav_controller.dart';
import 'package:movie_apps_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:movie_apps_flutter/app/modules/home/views/home_view.dart';
import 'package:movie_apps_flutter/app/modules/movies/views/movies_view.dart';
import 'package:movie_apps_flutter/app/modules/profile/views/profile_view.dart';

import '../models/movie-model.dart';

class BottomNavView extends StatelessWidget {
  BottomNavView({Key? key, required this.movie}) : super(key: key);

  final BottomNavController bottomNavC = Get.put(
    BottomNavController(),
    permanent: false,
  );
  MovieModel movie;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            body: SafeArea(
              child: IndexedStack(
                index: bottomNavC.tabIndex.value,
                children: [
                  HomeView(movie: movie.id),
                  MoviesView(),
                  ProfileView(),
                ],
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              onTap: bottomNavC.changeTabIndex,
              index: bottomNavC.tabIndex.value,
              height: 60,
              color: const Color.fromARGB(255, 23, 23, 43),
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              items: [
                bottomNavItems(
                  icon: CupertinoIcons.home,
                ),
                bottomNavItems(
                  icon: CupertinoIcons.film,
                ),
                bottomNavItems(icon: CupertinoIcons.person),
              ],
            ),
          ),
        );
      },
    );
  }

  bottomNavItems({required IconData icon}) {
    return Icon(icon, color: Colors.white, size: 30);
  }
}
