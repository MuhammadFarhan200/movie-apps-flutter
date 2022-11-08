import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/modules/home/views/home_view.dart';
import 'package:movie_apps_flutter/app/modules/movies/views/movies_view.dart';
import 'package:movie_apps_flutter/app/modules/profile/views/profile_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int index = 0;

  // final screens = [
  //   const HomeView(),
  //   const MoviesView(),
  //   const ProfileView(),
  // ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
        color: Color.fromARGB(255, 11, 11, 20),
      ),
      const Icon(
        Icons.movie_creation_outlined,
        size: 30,
        color: Color.fromARGB(255, 11, 11, 20),
      ),
      const Icon(
        Icons.person,
        size: 30,
        color: Color.fromARGB(255, 11, 11, 20),
      ),
    ];

    return GetMaterialApp(
      title: "Movie Apps",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color.fromARGB(255, 11, 11, 20),
        dialogTheme: const DialogTheme(
          contentTextStyle: TextStyle(fontFamily: 'Montserrat'),
        ),
        snackBarTheme: const SnackBarThemeData(
          contentTextStyle: TextStyle(fontFamily: 'Montserrat'),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
      ),
      enableLog: true,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Get.defaultTransitionDuration,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: SafeArea(
      //   top: false,
      //   child: Scaffold(
      //     extendBodyBehindAppBar: true,
      //     extendBody: true,
      //     bottomNavigationBar: CurvedNavigationBar(
      //       color: Colors.cyanAccent,
      //       backgroundColor: Colors.transparent,
      //       animationCurve: Curves.easeInOut,
      //       animationDuration: const Duration(milliseconds: 300),
      //       items: items,
      //       index: index,
      //       height: 50,
      //       onTap: (index) {
      //         setState(() {
      //           this.index = index;
      //         });
      //       },
      //     ),
      //     body: screens[index],
      //   ),
      // ),
    );
  }
}
