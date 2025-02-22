import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';

class MovieListScreen extends StatelessWidget {
  final String genre;

  MovieListScreen({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      appBar: AppBar(
        title: Text("$genre Movies"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: ApiManager.getMoviesByGenre(genre),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading movies"));
          } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
            return Center(child: Text("No movies found for $genre"));
          }

          List movies = snapshot.data as List;

          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];
              return Card(
                color: Colors.black,
                child: Column(
                  children: [
                    Image.network(movie.mediumCoverImage ?? ""),
                    SizedBox(height: 8),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
