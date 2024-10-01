import 'package:dartz/dartz.dart';
import 'package:movie_app/pages/Search_page/data/models/search_class.dart';
import 'package:movie_app/pages/home_screen/data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_app/pages/home_screen/data/models/movie.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/home_screen/view_model/get_more_like_view_model.dart';
import 'package:movie_app/pages/movie_Detials/data/models/movie_Detials_model.dart';
import 'package:movie_app/shared/error/excepcation.dart';
import 'package:movie_app/shared/error/failure.dart';

import '../../../Search_page/view_model/get_search.dart';
import '../../../movie_Detials/data/models/more_like.dart';
import '../../../movie_Detials/data/models/movie_detials.dart';

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

  @override
  Future<Either<Failure, MovieDetial>> getMovieDetials(movieDetialsParameter) async{
    final result= await baseMovieRepository.getMovieDetials(movieDetialsParameter);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(
          ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<MoreLike>>> getMoreLikeMovies
      (MoreLikeParameters moreLikeParameters) async{
    final result= await
    baseMovieRepository.getMoreLikeMovies(moreLikeParameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(
          ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Search>>> geSearchMovies( SearchParameters searchParameters)async {
    final result= await
    baseMovieRepository.getSearchMovies(searchParameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(
          ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
  }


