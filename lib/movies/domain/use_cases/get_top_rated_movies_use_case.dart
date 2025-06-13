// import 'package:dartz/dartz.dart';
// import 'package:moviecleanarch/core/utils/errors/failure.dart';
// import 'package:moviecleanarch/movies/domain/entities/movie.dart';
// import 'package:moviecleanarch/movies/domain/repositry/base_movie_repositry.dart';
//
// class GetTopRatedMoviesUseCase{
//   final BaseMoviesRepositry baseMoviesRepositry;
//
//   GetTopRatedMoviesUseCase({required this.baseMoviesRepositry});
//   Future<Either<Failure,List<Movie>>> getTopRatedMovies()async{
//     return await baseMoviesRepositry.getTopRatedMovies();
//   }
// }
import 'package:dartz/dartz.dart';

import '../../../core/utils/errors/failure.dart';
import '../../../core/utils/use_case/base_use_case.dart';
import '../entities/movie.dart';
import '../repositry/base_movie_repositry.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters >{
  final BaseMoviesRepositry baseMoviesRepositry;

  GetTopRatedMoviesUseCase({required this.baseMoviesRepositry});
  Future<Either<Failure,List<Movie>>>call(NoParameters noParameters)async{
    return await baseMoviesRepositry.getTopRatedMovies();
  }
}