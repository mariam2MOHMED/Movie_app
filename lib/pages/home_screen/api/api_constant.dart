class ApiConstant{
  static const String apiKey="ffc1f879898e670e13d37297ed30bbbc";
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String popular = '$baseUrl/movie/popular?language=en-US&api_key=$apiKey';
  static const String upcomming = '$baseUrl/movie/upcoming?language=en-US&api_key=$apiKey';
  static const String topRated = '$baseUrl/movie/top_rated?language=en-US&api_key=$apiKey';
//https://image.tmdb.org/t/p/w500
  static  String movieDetialsPath (int movieId)
  => '$baseUrl/movie/${movieId }?language=en-US&api_key=$apiKey';
  static  String moreLikePath (int movieId)
  => '$baseUrl/movie/${movieId}/similar?language=en-US&api_key=$apiKey';
  static  String searchPath (String query)
  => '$baseUrl/search/movie?language=en-US&api_key=$apiKey&query=$query';
  static  String genersByMovies (int generid)
  => '$baseUrl/discover/movie?api_key=$apiKey&with_genres=$generid';
  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';
  static String imageurl(String path)=>'$baseImageUrl$path';
  //static const String topRatedApi = '$baseUrl/movie/top_rated';
//https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=ffc1f879898e670e13d37297ed30bbbc
  static const String geners=
   'https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=$apiKey';
}