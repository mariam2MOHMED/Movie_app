
import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../models/movie.dart';

abstract class BaseMovieRepository{
  Future<Either<Failure,List<Movie>>>  getPapularMovie();
  Future<Either<Failure,List<Movie>>>  getNewRealeasesMovie();
  Future<Either<Failure,List<Movie>>>  getRecommendedMovie();
  // NewRealeases
}