import 'package:dartz/dartz.dart';
import 'package:moviesapp/search/domain/entities/movie_search.dart';

import '../../../core/utils/errors/failure.dart';


abstract class BaseSearchMovieRepositry{
  Future<Either<Failure,List<MovieSearch>>>getSearch(String query);
}