class AppConstants{
  static const String apiKey="0c165edb46e5475c0e903f76577e56ce";
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String papular=
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String newRelease="$baseUrl/movie/upcoming?api_key=$apiKey";
  static const String recommended="$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';
static String getPathImage(String path)=>"$baseImageUrl$path";
  static String movieDetialPath(int movieId)=>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String getRecommendationPath(int movieId)=>
      "$baseUrl/movie/${movieId}/similar?api_key=$apiKey";
static String getSearch(String query)=>
    "$baseUrl/search/movie?api_key=$apiKey&query=$query";
  static const String browse="$baseUrl/genre/movie/list?api_key=$apiKey";
  static  String generByMovies(generMovieId)
  => "$baseUrl/discover/movie?api_key=$apiKey&with_genres=$generMovieId";
}
