import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/modules/home/controllers/home_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        title: const Text('Profile'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => homeC.confirmLogout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: const Color.fromARGB(255, 23, 23, 43),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage(
                            'assets/images/user.png'),
                        height: 150,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'About You:',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text('Hanztt'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.mail),
                        SizedBox(width: 10),
                        Text('hanztt123@gmail.com'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Other:',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 10),
                        Text('Contact Us'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.privacy_tip),
                        SizedBox(width: 10),
                        Text('Privacy Policy'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.wysiwyg_sharp),
                        SizedBox(width: 10),
                        Text('Trems and Conditions'),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
