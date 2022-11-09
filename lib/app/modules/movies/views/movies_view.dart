import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movies_controller.dart';
import 'package:shimmer/shimmer.dart';

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
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () {
              if (movieC.isLoading.value) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[300]!,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 180/250,
                    ),
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              } else if (movieC.isError.value) {
                return Text(
                  "Error: ${movieC.errmsg.value.capitalize}",
                );
              } else //if loading == true, show progress indicator
                // ignore: curly_braces_in_flow_control_structures
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 3/4,
                  children: movieC.moviesData.value.map<Widget>(
                    (movie) {
                      // return Card(
                      //   child: ListTile(
                      //     onTap: () {},
                      //     leading: CircleAvatar(
                      //       backgroundImage: NetworkImage(movie.cover),
                      //     ),
                      //     title: Text(movie.judul),
                      //     subtitle: Text(
                      //       movie.sinopsis,
                      //       maxLines: 2,
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //   ),
                      // );
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image(
                                  image: new NetworkImage(
                                    'https://occ-0-2430-2433.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABboRq3GJ0wSZ0FqeK1EwuUPH5iTCEWqF37LyvXO1Z-XBAht4LA4ggwfnfKAhMXtz-wUmGmo9GM7Hhk9_Ily1BMiNtqyao0zVPo3NKR320IuCHkQxey591Rbyu2zB3g.jpg',
                                  ),
                                  height: 230,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
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
