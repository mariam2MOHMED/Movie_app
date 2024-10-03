

import '../../../home_screen/data/models/movie.dart';

abstract class WatchListRepository{
  Future<bool> deleteAll();
  Future<bool> removeMovie(Movie movie);
  Stream<List<Movie>> getAllMovies();
  Future<void> addMovie(Movie movie);
}