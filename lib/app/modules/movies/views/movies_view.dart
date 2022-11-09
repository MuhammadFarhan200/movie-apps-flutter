import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movies_controller.dart';

class MoviesView extends StatelessWidget {
  MoviesView({Key? key}) : super(key: key);
  final MovieController movieC = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () {
              if (movieC.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (movieC.isError.value) {
                return Text(
                  "Error: ${movieC.errmsg.value.capitalize}",
                );
              } else {}
                return GridView.count(
                  primary: false,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3/4,
                  children: movieC.moviesData.value.map<Widget>(
                    (movie) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color.fromARGB(255, 23, 23, 43),
                        child: InkWell(
                          onTap: () {},
                          onLongPress: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Container(
                                  height: 180,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:  NetworkImage(
                                    'https://occ-0-2430-2433.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABboRq3GJ0wSZ0FqeK1EwuUPH5iTCEWqF37LyvXO1Z-XBAht4LA4ggwfnfKAhMXtz-wUmGmo9GM7Hhk9_Ily1BMiNtqyao0zVPo3NKR320IuCHkQxey591Rbyu2zB3g.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  movie.judul,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                );
            },
          ),
        ),
      ),
    );
  }
}
