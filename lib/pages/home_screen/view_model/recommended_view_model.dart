import '../data/models/movie.dart';
import '../data/repository/base_movie_repositry.dart';

class GetRecommendedMovies{
  final BaseMovieRepository baseMovieRepository;
  GetRecommendedMovies(this.baseMovieRepository);
  Future<List<Movie>>getRecommanded()async{
    return baseMovieRepository.getRecommendedMovie();
  }
}