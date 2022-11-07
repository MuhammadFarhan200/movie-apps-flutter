import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 11, 11, 20),
        title: const Image(
          height: 80,
          image: AssetImage('assets/images/movie-apps-logo-no-bg.png'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Image(
          image: AssetImage('assets/images/movie-apps-logo-no-bg.png'),
        ),
      ),
    );
  }
}
