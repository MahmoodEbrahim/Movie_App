import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/ListResponse.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Movies? movieDetails;
  Torrents? moviesD2;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  void fetchMovieDetails() async {
    var details = await ApiManager.getMovieDetails(widget.movieId);
    setState(() {
      movieDetails = details;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : movieDetails == null
          ? const Center(child: Text("⚠️ Failed to load movie details."))
          : SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background image container
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movieDetails!.mediumCoverImage ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient overlay
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.75),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5, // Moving this content down
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Image.asset("assets/images/screenpic/watch.png"),
                      SizedBox(height: 150), // Space between image and text
                      GestureDetector(
                        onTap: () {
                          print('Icon tapped');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            movieDetails!.title ?? "Unknown Title",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        " ${movieDetails!.year?.toString() ?? 'Unknown'}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Watch",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffE82626),
                                minimumSize: Size(double.infinity, 60), // Make it stretch horizontally
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15), // Rounded corners
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15), // Add vertical padding for more space
                                elevation: 5, // Shadow effect
                              ),
                            ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  spacing: 20,
                                  children: [
                                    Container(
                                      height: 84,
                                      width: 115,
                                      decoration: BoxDecoration(
                                        color: Color(0xff282A28),
                                        borderRadius: BorderRadius.circular(20), // تحديد نصف قطر الزوايا المدورة
                                      ),
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Icon(Icons.language,color: Colors.yellow,size: 25,),
                                              SizedBox(width: 10,),
            
                                              Text(
                                                " ${movieDetails!.language?.toString() ?? 'Unknown'}",
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 84,
                                      width: 115,
                                      decoration: BoxDecoration(
                                        color: Color(0xff282A28),
                                        borderRadius: BorderRadius.circular(20), // تحديد نصف قطر الزوايا المدورة
                                      ),
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                                        child: Row(
                                          children: [
                                            Icon(Icons.timelapse,color: Colors.yellow,size: 25,),
                                            SizedBox(width: 10,),
            
                                            Text(
                                              " ${movieDetails!.runtime?.toString() ?? 'Unknown'}",
                                              style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 84,
                                      width: 115,
                                      decoration: BoxDecoration(
                                        color: Color(0xff282A28),
                                        borderRadius: BorderRadius.circular(20), // تحديد نصف قطر الزوايا المدورة
                                      ),
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.yellow,size: 25,),
                                            SizedBox(width: 10,),
                                            Text(
                                              "${movieDetails!.rating?.toString() ?? 'Unknown'}",
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
            
                                  ],
                                ),
                              ),
                            ],
                          )
            
                        ],
                      ),
                        ],
                  ),
                ),
                // Favorite button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  right: 15,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.favorite_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                // Back button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 15,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.keyboard_backspace,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Screen Shots",style: TextStyle(
                    color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 2000,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(movieDetails!.backgroundImageOriginal ?? ""),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20), //
                                    ),
                                  ),
                                  SizedBox(height: 13,),
                                  Container(
                                    width: double.infinity,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(movieDetails!.backgroundImageOriginal ?? ""),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20), //
                                    ),
                                  ),
                                  SizedBox(height: 13,),

                                  Container(
                                    width: double.infinity,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(movieDetails!.backgroundImageOriginal ?? ""),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20), //
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 14,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Similar",style:
                            TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [

                                  ],
                                )
                              ],
                            )

                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}
