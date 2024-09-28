// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   final String _apiKey = 'ffc1f879898e670e13d37297ed30bbbc';
//   final String _baseUrl = 'https://api.themoviedb.org/3';

//   // Get genres
//   Future<List<dynamic>> getGenres() async {
//     final url = '$_baseUrl/genre/movie/list?api_key=$_apiKey&language=en-US';
//     final response = await http.get(Uri.parse(url));
    
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['genres'];
//     } else {
//       throw Exception('Failed to load genres');
//     }
//   }

//   // Get movies by genre
//   Future<List<dynamic>> getMoviesByGenre(int genreId) async {
//     final url =
//         '$_baseUrl/discover/movie?=$_apiKey&language=en-US&with_genres=$genreId';
//     final response = await http.get(Uri.parse(url));
    
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['results'];
//     } else {
//       throw Exception('Failed to load movies');
//     }
//   }
// }
// import 'package:http/http.dart' as http;

// class ApiService {
// static Future getGenres(String categoryId) async {
//   Uri.https(authority);
// http.get(url)

// }

// }
import 'dart:convert'; 
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'ffc1f879898e670e13d37297ed30bbbc'; 
   
  Future<List<dynamic>> getGenres() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['genres'];
    } else {
      throw Exception('Failed to load genres');
    }
  }

  
  Future<List<dynamic>> getMoviesByGenre(int genreId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genreId'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results']; 
    } else {
      throw Exception('Failed to load movies by genre');
    }
  }
}