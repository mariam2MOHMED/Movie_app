import '../data/models/movie.dart';
import '../data/repository/base_movie_repositry.dart';

class GetPapularMovie{
  final BaseMovieRepository baseMovieRepository;
  GetPapularMovie(this.baseMovieRepository);
  Future <List<Movie>> extxute()async{
    return await baseMovieRepository.getPapularMovie();
  }
}