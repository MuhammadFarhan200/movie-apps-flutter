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
        title: const Image(
          height: 80,
          image: AssetImage('assets/images/movie-apps-logo-no-bg.png'),
        ),
        centerTitle: false,
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Welcome to home page!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
