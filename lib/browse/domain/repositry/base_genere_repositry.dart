import 'package:dartz/dartz.dart';
import 'package:moviesapp/browse/domain/entities/gener_by_movies.dart';
import 'package:moviesapp/browse/domain/entities/genere_list.dart';
import 'package:moviesapp/core/utils/errors/failure.dart';


abstract class BaseGenereRepositry{

  Future<Either<Failure,List<GenereList>>>getGenerListMovies();
  Future<Either<Failure,List<GenerByMovies>>>getGenerByMovies(int generMoviesId);
}
