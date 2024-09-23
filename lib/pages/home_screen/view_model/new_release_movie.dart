

import '../data/models/movie.dart';
import '../data/repository/base_movie_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/error/failure.dart';
class GetNewReleaseMovieiewModel{
  final BaseMovieRepository baseMovieRepository;
  GetNewReleaseMovieiewModel(
      this.baseMovieRepository
      );
  Future<Either<Failure,List<Movie>>> getNewRelease()async{
    return await baseMovieRepository.getNewRealeasesMovie();
  }
}