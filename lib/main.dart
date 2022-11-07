import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Color.fromARGB(255, 11, 11, 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.blue),
        ),
      ),
      enableLog: true,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Get.defaultTransitionDuration,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
