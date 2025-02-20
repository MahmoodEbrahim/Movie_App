import 'package:flutter/material.dart';
import '../movies_from_api/List_Section.dart';
import '../movies_from_api/movies_Suggestions.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const ListSection(),
          buildMovieSection("Action", 10),
          buildMovieSection("Horror", 5),
        ],
      ),
    );
  }

  Widget buildMovieSection(String genre, int movieId) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  genre,
                  style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: const Text(
                  "See More ->",
                  style: TextStyle(color: Color(0xFFF6BD00), fontSize: 18),
                ),
              ),
            ],
          ),
          MoviesSuggestions(movieId: movieId),
        ],
      ),
    );
  }
}
