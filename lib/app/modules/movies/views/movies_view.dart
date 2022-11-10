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
                childAspectRatio: 3 / 3.5,
                children: movieC.moviesData.value.map<Widget>(
                  (movie) {
                    return InkWell(
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
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: const NetworkImage(
                                        'https://occ-0-2430-2433.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABboRq3GJ0wSZ0FqeK1EwuUPH5iTCEWqF37LyvXO1Z-XBAht4LA4ggwfnfKAhMXtz-wUmGmo9GM7Hhk9_Ily1BMiNtqyao0zVPo3NKR320IuCHkQxey591Rbyu2zB3g.jpg'),
                                    fit: BoxFit.cover,
                                    height: Get.height * 0.40,
                                    width: Get.width,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    width: Get.width,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 12,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      movie.judul,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // child: Container(
                            //   height: 180,
                            //   decoration: const BoxDecoration(
                            //     image: DecorationImage(
                            //       image:  NetworkImage(
                            //     'https://occ-0-2430-2433.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABboRq3GJ0wSZ0FqeK1EwuUPH5iTCEWqF37LyvXO1Z-XBAht4LA4ggwfnfKAhMXtz-wUmGmo9GM7Hhk9_Ily1BMiNtqyao0zVPo3NKR320IuCHkQxey591Rbyu2zB3g.jpg',
                            //   ),
                            //   fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: Text(
                          //     movie.judul,
                          //     maxLines: 2,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                        ],
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
