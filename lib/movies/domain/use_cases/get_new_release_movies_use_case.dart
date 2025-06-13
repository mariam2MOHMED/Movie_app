// import 'package:dartz/dartz.dart';
// import 'package:moviecleanarch/movies/domain/entities/movie.dart';
// import 'package:moviecleanarch/movies/domain/repositry/base_movie_repositry.dart';
//
// import '../../../core/utils/errors/failure.dart';
//
// class GetNewReleaseMoviesUseCase{
//   final BaseMoviesRepositry baseMoviesRepositry;
//
//   GetNewReleaseMoviesUseCase({required this.baseMoviesRepositry});
//   Future<Either<Failure,List<Movie>>>getNewReleaseMovies()async{
//     return await baseMoviesRepositry.getNewReleaseMovies();
//   }
// }
//
import 'package:dartz/dartz.dart';

import '../../../core/utils/errors/failure.dart';
import '../../../core/utils/use_case/base_use_case.dart';
import '../entities/movie.dart';
import '../repositry/base_movie_repositry.dart';

class GetNewReleaseMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepositry baseMoviesRepositry;

  GetNewReleaseMoviesUseCase({required this.baseMoviesRepositry});
  @override
  Future<Either<Failure,List<Movie>>>call(NoParameters noParameters)async{
    return await baseMoviesRepositry.getNewReleaseMovies();
  }
}