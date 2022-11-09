import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  final DetailController detailController =
      Get.find<DetailController>(tag: Get.arguments as String);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Judul: ${detailController.detailMovie.value.judul}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
