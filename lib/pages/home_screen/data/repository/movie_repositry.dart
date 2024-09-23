import 'package:dartz/dartz.dart';
import 'package:movie_app/pages/home_screen/data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_app/pages/home_screen/data/models/movie.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/shared/error/excepcation.dart';
import 'package:movie_app/shared/error/failure.dart';

class MovieRepositry extends BaseMovieRepository{
  final BaseMovieRemoteDataSources baseMovieRepository;
  MovieRepositry(this.baseMovieRepository);
  @override
  Future<Either<Failure,List<Movie>>> getNewRealeasesMovie()async {
    // TODO: implement getNewRealeasesMovie
  final result= await baseMovieRepository.getNewReleaseMovie();
try{
  return Right(result);
}on ServerException catch(failure){
  return Left(
      ServerFailure(failure.errorMessageModel.statusMessage));
}
  }

  @override
  Future<Either<Failure, List<Movie>>> getPapularMovie() async{
    final result= await baseMovieRepository.getPapularMovie();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(
          ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getRecommendedMovie() async{
    final result= await baseMovieRepository.getRecommendedMovie();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(
          ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


}