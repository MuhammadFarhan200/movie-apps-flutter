import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 80,
        title: const Text(' Profile'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => controller.confirmLogout(),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: ListView(
          primary: false,
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
                    const Center(
                      child: Image(
                        image: AssetImage(
                          'assets/images/user.png',
                        ),
                        height: 150,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'About You:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text('Your Name'),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: const [
                        Icon(Icons.mail),
                        SizedBox(width: 10),
                        Text('Your Email'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Other:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.phone),
                        SizedBox(width: 10),
                        Text('Contact Us'),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: const [
                        Icon(Icons.privacy_tip),
                        SizedBox(width: 10),
                        Text('Privacy Policy'),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: const [
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
