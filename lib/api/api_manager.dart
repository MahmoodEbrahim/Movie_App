import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/ListResponse.dart';

class ApiManager {
 static const String baseUrl = "yts.mx";
 static const String movieListEndpoint = "/api/v2/list_movies.json";
 static const String movieDetailsEndpoint = "/api/v2/movie_details.json";
 static const String MovieSuggestions="/api/v2/movie_suggestions.json";


 static Future<ListResponse?> getMovies() async {
  try {
   Uri url = Uri.https(baseUrl, movieListEndpoint);
   http.Response response = await http.get(url);

   print("Response Status Code: ${response.statusCode}");
   print("Response Body: ${response.body}");

   if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    return ListResponse.fromJson(jsonData);
   } else {
    print("Error: ${response.statusCode}");
    return null;
   }
  } catch (e) {
   print("Exception: $e");
   return null;
  }
 }

 static Future<Movies?> getMovieDetails(int movieId) async {
  try {
   var url = Uri.https(baseUrl, "/api/v2/movie_details.json", {"movie_id": movieId.toString()});
   var response = await http.get(url);

   if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return Movies.fromJson(jsonData['data']['movie']);
   } else {
    return null;
   }
  } catch (e) {
   print("Error fetching movie details: $e");
   return null;
  }
 }

 static Future<ListResponse?> getMovieSuggestions(int movieId) async {
  try {
   final Uri url = Uri.parse("https://yts.mx/api/v2/movie_suggestions.json?movie_id=$movieId");
   final response = await http.get(url);

   if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return ListResponse.fromJson(jsonData); // استرجاع ListResponse بدلاً من Movies
   } else {
    print("❌ Error: Failed to load suggestions. Status: ${response.statusCode}");
    return null;
   }
  } catch (e) {
   print("❌ Exception: $e");
   return null;
  }
 }

 static Future<MovieParentalGuides?> getMovieParentalGuides(int movieId) async {
  try {
   final Uri url = Uri.parse("https://yts.mx/api/v2/movie_parental_guides.json?movie_id=$movieId");
   final response = await http.get(url);

   if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return MovieParentalGuides.fromJson(jsonData['data']); // تحويل البيانات إلى نموذج MovieParentalGuides
   } else {
    print("❌ Error: Failed to load parental guides. Status: ${response.statusCode}");
    return null;
   }
  } catch (e) {
   print("❌ Exception: $e");
   return null;
  }
 }

 static Future<List<Movies>> getMoviesByGenre(String genre) async {
 try {
 Uri url = Uri.https(baseUrl, "/api/v2/list_movies.json", {"genre": genre});
 var response = await http.get(url);

 if (response.statusCode == 200) {
 var jsonData = jsonDecode(response.body);
 var moviesData = jsonData['data']['movies'] as List;
 return moviesData.map((movie) => Movies.fromJson(movie)).toList();
 }
 return [];
 } catch (e) {
 print("Error fetching movies: $e");
 return [];
 }
 }
 }


