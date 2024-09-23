import 'package:dartz/dartz.dart';

import '../../../shared/error/failure.dart';
import '../data/models/movie.dart';
import '../data/repository/base_movie_repositry.dart';

class GetRecommendedMoviesiewModel{
  final BaseMovieRepository baseMovieRepository;
  GetRecommendedMoviesiewModel(this.baseMovieRepository);
  Future<Either<Failure,List<Movie>>> getRecommanded()async{
    return baseMovieRepository.getRecommendedMovie();
  }
}