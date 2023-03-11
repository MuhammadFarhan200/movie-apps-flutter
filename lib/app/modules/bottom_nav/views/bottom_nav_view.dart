import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../movies/views/movies_view.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeView(),
                MoviesView(),
              ],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              onTap: controller.changeTabIndex,
              index: controller.tabIndex.value,
              height: 60,
              color: const Color.fromARGB(255, 23, 23, 43),
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              items: [
                bottomNavItems(icon: CupertinoIcons.home),
                bottomNavItems(icon: CupertinoIcons.film),
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
