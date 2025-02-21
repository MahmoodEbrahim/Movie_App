import 'package:flutter/material.dart';
import 'package:movies_app/model/ListResponse.dart';
import 'package:movies_app/api/api_manager.dart';
import 'movies_det.dart';

class MoviesSuggestionsVertical extends StatefulWidget {
  final int movieId;
  const MoviesSuggestionsVertical({super.key, required this.movieId});

  @override
  State<MoviesSuggestionsVertical> createState() => _MoviesSuggestionsVerticalState();
}

class _MoviesSuggestionsVerticalState extends State<MoviesSuggestionsVertical> {
  List<Movies> suggestedMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSuggestedMovies();
  }

  void fetchSuggestedMovies() async {
    try {
      var response = await ApiManager.getMovieSuggestions(widget.movieId);

      if (response != null && response is ListResponse) {
        if (response.data != null && response.data!.movies != null) {
          setState(() {
            suggestedMovies = response.data!.movies!;
            isLoading = false;
          });
        } else {
          print("❌ No movies found in the response data.");
          setState(() {
            isLoading = false;
          });
        }
      } else {
        print("❌ The response is null or not of type ListResponse.");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("❌ Exception: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 545,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : suggestedMovies.isEmpty
          ? const Center(child: Text("No suggestions available"))
          : Column(
        children: [
          Row(
            children: [

              _buildSuggestedMovie(suggestedMovies[0]),
              SizedBox(width: 15),
              _buildSuggestedMovie(suggestedMovies[1]),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              _buildSuggestedMovie(suggestedMovies[2]),
              SizedBox(width: 15),
              _buildSuggestedMovie(suggestedMovies[3]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedMovie(Movies movie) {
    return GestureDetector(
      onTap: () {
        int? movieId = movie.id;
        print("Selected Movie ID: $movieId");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movieId: movieId!),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              movie.mediumCoverImage ?? '',
              width: 185,
              height: 255,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 160),
            ),
          ),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}
