import 'package:movie_app/pages/watch_list/data/repositry/watch_list_repositry.dart';

import '../../../home_screen/data/models/movie.dart';
import '../data_sources/watch_list_data_sources.dart';
import 'package:movie_app/pages/home_screen/data/models/movie.dart';

class WatchListRepositoryImpl implements WatchListRepository{
  WatchListDataSource dataSource;
  WatchListRepositoryImpl({required this.dataSource});
  Future<bool> deleteAll()async {
    var response= await dataSource.deleteAll();
    return response;

  }
  Future<bool> removeMovie(Movie movie) async {
    var response=await dataSource.removeMovie(movie);
    return response;
  }
  Stream<List<Movie>> getAllMovies() async*{
    var response=await dataSource.getAllMovies();
    yield* response;

  }
  Future<void> addMovie(Movie movie) async {
    var response=await dataSource.addMovie(movie);
    return response;
  }
}