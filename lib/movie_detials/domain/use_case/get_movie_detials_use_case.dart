import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/errors/failure.dart';
import '../../../core/utils/use_case/base_use_case.dart';
import '../../../movies/domain/repositry/base_movie_repositry.dart';
import '../entities/movie_detials.dart';

class GetMovieDetialsUseCase extends BaseUseCase<MovieDetials,MovieDetialsParameters>{
  final BaseMoviesRepositry baseMoviesRepositry;

  GetMovieDetialsUseCase({required this.baseMoviesRepositry});
  @override
  Future<Either<Failure, MovieDetials>> call(MovieDetialsParameters movieDetialsParameters)async {
   return await baseMoviesRepositry.getMovieDetials(movieDetialsParameters);
  }

}
class MovieDetialsParameters extends Equatable{
  final int id;

  MovieDetialsParameters({required this.id});
  @override
  List<Object?>
  get props =>
      [id];

}