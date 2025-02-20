import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/ListResponse.dart';

class MoviesSuggestions extends StatefulWidget {
  final int movieId;
  const MoviesSuggestions({super.key, required this.movieId});

  @override
  State<MoviesSuggestions> createState() => _MoviesSuggestionsState();
}

class _MoviesSuggestionsState extends State<MoviesSuggestions> {
  List<Movies> suggestedMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSuggestedMovies();
  }

  void fetchSuggestedMovies() async {
    try {
      // استدعاء الدالة التي تُرجع ListResponse
      var response = await ApiManager.getMovieSuggestions(widget.movieId);

      // التحقق إذا كانت الاستجابة تحتوي على بيانات وصحيحة
      if (response != null && response is ListResponse) {
        if (response.data != null && response.data!.movies != null) {
          setState(() {
            suggestedMovies = response.data!.movies!; // تعيين الأفلام من data
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
      height: 200, // تحديد ارتفاع مناسب للصف
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : suggestedMovies.isEmpty
          ? const Center(child: Text("No suggestions available"))
          : ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suggestedMovies.length,
        itemBuilder: (context, index) {
          final movie = suggestedMovies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    movie.mediumCoverImage ?? '',
                    width: 120,
                    height: 160,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 120),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 120,
                  child: Text(
                    movie.title ?? 'Unknown',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
