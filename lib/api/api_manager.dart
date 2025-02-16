import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/ListResponse.dart';

class ApiManager {
 static const String baseUrl = "yts.mx";
 static const String endpoint = "/v2/list_movies.json";

 static Future<ListResponse?> getMovies() async {
  try {
   Uri url = Uri.https(baseUrl, endpoint);
   http.Response response = await http.get(url);

   if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    return ListResponse.fromJson(json);
   } else {
    print("Error: ${response.statusCode}");
    return null;
   }
  } catch (e) {
   print("Exception: $e");
   return null;
  }
 }
 static Future<Map<String, dynamic>?> login(String email, String password) async {
  var request = http.Request('POST', Uri.parse('auth/login'));
 request.body = '''{\n    "email":"amr2@gmail.com",\n    "password":"Test2510@"\n}''';

 http.StreamedResponse response = await request.send();

 if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
 }
 else {
  print(response.reasonPhrase);
 }
 }
}
