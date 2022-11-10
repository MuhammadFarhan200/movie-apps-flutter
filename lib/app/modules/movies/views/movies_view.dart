import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/modules/detail/views/detail_view.dart';
import 'package:movie_apps_flutter/app/modules/home/controllers/home_controller.dart';

import '../controllers/movies_controller.dart';

class MoviesView extends StatelessWidget {
  MoviesView({Key? key}) : super(key: key);
  final MovieController movieC = Get.put(MovieController());
  final HomeController homeC = Get.put(HomeController());
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
              return GridView.builder(
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                ),
                itemCount: movieC.moviesData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailView(movie: movieC.moviesData[index]));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                        child: Image(
                          image: AssetImage(homeC.imageSliders[movieC.moviesData[index].id - 1]),
                          // image: NetworkImage(
                          //   'https://occ-0-2430-2433.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABboRq3GJ0wSZ0FqeK1EwuUPH5iTCEWqF37LyvXO1Z-XBAht4LA4ggwfnfKAhMXtz-wUmGmo9GM7Hhk9_Ily1BMiNtqyao0zVPo3NKR320IuCHkQxey591Rbyu2zB3g.jpg',
                          // ),
                          fit: BoxFit.cover,
                        ),
                        footer: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.black.withOpacity(0.7),
                          child: Center(
                            child: Text(
                              '${movieC.moviesData[index].judul}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
