// import 'package:dartz/dartz.dart';
// import 'package:moviecleanarch/core/utils/errors/failure.dart';
// import 'package:moviecleanarch/movies/data/data_source/movie_remote_data_source.dart';
// import 'package:moviecleanarch/movies/domain/entities/movie.dart';
// import 'package:moviecleanarch/movies/domain/repositry/base_movie_repositry.dart';
//
// class MoviesRepositry extends BaseMoviesRepositry{
//  final BaseMovieRemoteDataSource baseMoviesRemoteDataSource;
//
//   MoviesRepositry({required this.baseMoviesRemoteDataSource});
//   @override
//   Future<Either<Failure, List<Movie>>> getNewReleaseMovies()async {
//    return await baseMoviesRemoteDataSource.getNewReleaseMovies();
//   }
//
//   @override
//   Future<Either<Failure, List<Movie>>> getPapularMovies()async {
//     return await baseMoviesRemoteDataSource.getPopularMovies();
//   }
//
//   @override
//   Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
//     return await baseMoviesRemoteDataSource.getTopRatedMovies();
//   }
//
// }
import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/utils/errors/failure.dart';
import 'package:moviesapp/movie_detials/domain/entities/movie_detials.dart';
import 'package:moviesapp/movie_detials/domain/use_case/get_movie_detials_use_case.dart';
import 'package:moviesapp/movie_detials/domain/use_case/get_recommendation_use_case.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';
import '../../../movie_detials/domain/entities/Recommendation.dart';
import '../../domain/repositry/base_movie_repositry.dart';
import '../data_source/movie_remote_data_source.dart';

class MovieRepositry extends BaseMoviesRepositry{
  final BaseMovieDataSource baseMovieDataSource;

  MovieRepositry({required this.baseMovieDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getNewReleaseMovies() async{
    return await baseMovieDataSource.getNewReleaseMovies();
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    // TODO: implement getPopularMovies
    return await baseMovieDataSource.getPapularMovies();
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    // TODO: implement getTopRatedMovies
    return await baseMovieDataSource.getTopRatedMovies();
  }

  @override
  Future<Either<Failure, MovieDetials>> getMovieDetials
      (MovieDetialsParameters movieDetialsParameters) async{
   return await baseMovieDataSource.getMoviesDetials(movieDetialsParameters);
  }

  @override
  Future<Either<Failure, List<Recommendation>>>
  getRecommendation(RecommendationParameters parameters) async {
    return await baseMovieDataSource.getRecommendation(parameters);
  }

}