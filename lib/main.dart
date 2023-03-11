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
        fontFamily: 'Ubuntu',
        scaffoldBackgroundColor: const Color.fromARGB(255, 11, 11, 20),
        dialogTheme: const DialogTheme(
          contentTextStyle: TextStyle(fontFamily: 'Ubuntu'),
        ),
        snackBarTheme: const SnackBarThemeData(
          contentTextStyle: TextStyle(fontFamily: 'Ubuntu'),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.cyanAccent),
          ),
        ),
        popupMenuTheme: const PopupMenuThemeData(
          color: Color.fromARGB(255, 23, 23, 43),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent),
      ),
      enableLog: true,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
