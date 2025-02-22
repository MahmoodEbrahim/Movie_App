import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import '../model/ListResponse.dart';


class BrowseaTab extends StatefulWidget {
  const BrowseaTab({super.key});

  @override
  _BrowseTabState createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseaTab> {
  List<String> genres = [
    "Action", "Comedy", "Drama", "Horror", "Romance", "Sci-Fi", "Thriller"
  ];
  String selectedGenre = "Action";
  Future<List<Movies>>? moviesFuture;

  @override
  void initState() {
    super.initState();
    moviesFuture = ApiManager.getMoviesByGenre(selectedGenre);
  }

  void _changeGenre(String genre) {
    setState(() {
      selectedGenre = genre;
      moviesFuture = ApiManager.getMoviesByGenre(genre);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff121312),

        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _changeGenre(genres[index]),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: selectedGenre == genres[index] ? Color(0xffF6BD00) : Color(0xff2A282A),
                        borderRadius: BorderRadius.circular(20),
                        border: selectedGenre == genres[index]
                            ? Border.all(color: Color(0xffF6BD00), width: 1)
                            : Border.all(color: Color(0xffF6BD00), width: 1),
                      ),

                      child: Text(
                        genres[index],
                        style: TextStyle(
                            color:selectedGenre == genres[index] ? Colors.black:Colors.yellow,
                        fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<Movies>?>(
                future: moviesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error loading movies"));
                  } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                    return Center(child: Text("No movies found for $selectedGenre"));
                  }
                  List<Movies> movies = snapshot.data!;
                  return GridView.builder(
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      var movie = movies[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 6,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                movie.mediumCoverImage ?? "",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        movie.rating?.toString() ?? "N/A",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.star, color: Colors.yellow, size: 16),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
