import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/ListResponse.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ListResponse?>(
        future: ApiManager.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load movies"));
          }

          var movies = snapshot.data!.data?.movies;
          if (movies == null || movies.isEmpty) {
            return const Center(child: Text("No movies available"));
          }

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];
              return ListTile(
                leading: movie.mediumCoverImage != null
                    ? Image.network(movie.mediumCoverImage!, width: 50, height: 75, fit: BoxFit.cover)
                    : const Icon(Icons.movie),
                title: Text(movie.title ?? "Unknown Title"),
                subtitle: Text("Rating: ${movie.rating?.toString() ?? "N/A"}"),
              );
            },
          );
        },
      ),

    );
  }
}
