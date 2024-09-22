
import '../models/movie.dart';

abstract class BaseMovieRepository{
  Future <List<Movie>> getPapularMovie();
  Future <List<Movie>> getNewRealeasesMovie();
  Future <List<Movie>> getRecommendedMovie();
  // NewRealeases
}