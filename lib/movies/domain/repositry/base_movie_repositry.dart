// import 'package:dartz/dartz.dart';
// import 'package:moviecleanarch/core/utils/errors/failure.dart';
// import 'package:moviecleanarch/movies/domain/entities/movie.dart';
//
// abstract class BaseMoviesRepositry{
// Future<Either<Failure,List<Movie>>>getPapularMovies();
// Future<Either<Failure,List<Movie>>>getNewReleaseMovies();
// Future<Either<Failure,List<Movie>>>getTopRatedMovies();
// }
import'package:dartz/dartz.dart';

import '../../../core/utils/errors/failure.dart';
import '../../../movie_detials/domain/entities/Recommendation.dart';
import '../../../movie_detials/domain/entities/movie_detials.dart';
import '../../../movie_detials/domain/use_case/get_movie_detials_use_case.dart';
import '../../../movie_detials/domain/use_case/get_recommendation_use_case.dart';
import '../entities/movie.dart';
abstract class BaseMoviesRepositry{
  Future<Either<Failure,List<Movie>>>getPopularMovies();
  Future<Either<Failure,List<Movie>>>getNewReleaseMovies();
  Future<Either<Failure,List<Movie>>>getTopRatedMovies();
  Future<Either<Failure,MovieDetials>>getMovieDetials(MovieDetialsParameters parameters);
  Future<Either<Failure,List<Recommendation>>>
  getRecommendation(RecommendationParameters parameters);
}