

import '../data/models/movie.dart';
import '../data/repository/base_movie_repositry.dart';

class GetNewReleaseMovie{
  final BaseMovieRepository baseMovieRepository;
  GetNewReleaseMovie(
      this.baseMovieRepository
      );
  Future<List<Movie>> getNewRelease()async{
    return await baseMovieRepository.getNewRealeasesMovie();
  }
}