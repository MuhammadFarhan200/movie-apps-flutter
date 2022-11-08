import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/controllers/bottom_nav_controller_controller.dart';
import 'package:movie_apps_flutter/app/modules/home/views/home_view.dart';
import 'package:movie_apps_flutter/app/modules/movies/views/movies_view.dart';
import 'package:movie_apps_flutter/app/modules/profile/views/profile_view.dart';

class BottomNavView extends StatelessWidget {
  BottomNavView({Key? key}) : super(key: key);
  final BottomNavController bottomNavC = Get.put(
    BottomNavController(),
    permanent: false,
  );

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.movie_creation_outlined, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.cyanAccent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        items: items,
        height: 50,
        index: bottomNavC.tabIndex.value,
        onTap: bottomNavC.changeTabIndex,
      ),
      body: Obx(
        () => IndexedStack(
          index: bottomNavC.tabIndex.value,
          children: const [
            HomeView(),
            MoviesView(),
            ProfileView(),
          ],
        ),
      ),
    );
  }
}
