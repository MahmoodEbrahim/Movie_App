import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../model/ListResponse.dart';
import 'movies_det.dart';

class ListSection extends StatefulWidget {
  const ListSection({super.key});

  @override
  State<ListSection> createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListResponse?>(
      future: ApiManager.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data!.data?.movies == null) {
          return const Center(
              child: Text("⚠️ Failed to load movies. Please try again."));
        } else {
          var movies = snapshot.data!.data!.movies!;
          return Column(
            children: [
              Container(
                height: 640,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/OnboardingPic/onboarding6.png",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black26.withOpacity(.65),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child:
                          Image.asset("assets/images/screenpic/availablenow.png"),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Stack(
                        children: [
                          Row(
                            children: List.generate(
                              movies.length,
                              (index) {
                                var movie = movies[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      int? movieId =
                                          movie.id;
                                      print("Selected Movie ID: $movieId");
              
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailsScreen(movieId: movieId!),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      movie.mediumCoverImage!),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color:
                                                      Colors.black.withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(12.0),
                                                ),
                                                child: Text(
                                                  "${movie.rating?.toString() ?? 'N/A'} ⭐",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Image.asset("assets/images/screenpic/watchnow.png"),
                  ],
                ),
              ),

            ],
          );
          
        }
      },
    );
  }
}
