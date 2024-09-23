class ApiConstant{
  static const String apiKey="ffc1f879898e670e13d37297ed30bbbc";
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String popular = '$baseUrl/movie/popular?language=en-US&api_key=$apiKey';
  static const String upcomming = '$baseUrl/movie/upcoming?language=en-US&api_key=$apiKey';
  static const String topRated = '$baseUrl/movie/top_rated?language=en-US&api_key=$apiKey';

  //static const String topRatedApi = '$baseUrl/movie/top_rated';
}