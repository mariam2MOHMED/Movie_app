import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/browse/domain/repositry/base_genere_repositry.dart';
import 'package:moviesapp/core/utils/errors/failure.dart';
import 'package:moviesapp/core/utils/use_case/base_use_case.dart';

import '../entities/gener_by_movies.dart';

class GetMoviesByGenersUseCase extends
BaseUseCase<List<GenerByMovies>,GenerByMovieParameters>{
  final BaseGenereRepositry genereRepositry;

  GetMoviesByGenersUseCase({required this.genereRepositry});

  @override
  Future<Either<Failure, List<GenerByMovies>>> call(GenerByMovieParameters parameters)
  async{
    // TODO: implement call
   return  await genereRepositry.getGenerByMovies(parameters.id);
  }
}
class GenerByMovieParameters extends Equatable{
  final int id;

  GenerByMovieParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}