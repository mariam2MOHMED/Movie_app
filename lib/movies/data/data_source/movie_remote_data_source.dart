// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:moviecleanarch/core/utils/app_constants.dart';
// import 'package:moviecleanarch/movies/data/models/movie_model.dart';
//
// import '../../../core/utils/errors/failure.dart';
//
// abstract class BaseMovieRemoteDataSource{
//   Future<Either<Failure,List<MovieModel>>>getPopularMovies();
//   Future<Either<Failure,List<MovieModel>>>getNewReleaseMovies();
//   Future<Either<Failure,List<MovieModel>>>getTopRatedMovies();
// }
// class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
//  final Dio dio=Dio();
//   @override
//   Future<Either<Failure, List<MovieModel>>> getNewReleaseMovies
//       () async {
//   try{
//     var response=await dio.get(AppConstants.newRelease);
//
//       if(response.statusCode==200){
//   List<MovieModel> movies = (response.data['results'] as List)
//       .map((item) => MovieModel.fromJson(item))
//       .toList();
//   print("New Release Movies ${movies}");
//   return right(movies);
// }else{
//   return left(ServerFailure(
//       message:   'Unexpected status code: ${response.statusCode}'));
// }
//
//   }on ServerFailure catch(e){
// return left(ServerFailure(message: e.message));
//   }
//   }
//
//   @override
//   Future<Either<Failure, List<MovieModel>>> getPopularMovies()
//   async {
//     try{
//       final response=await Dio().get(AppConstants.newRelease);
//       if (response.statusCode == 200) {
//         List<MovieModel> movies = (response.data['results']
//         as List)
//             .map((item) => MovieModel.fromJson(item))
//             .toList();
//
//         return right(movies);
//       } else {
//         print("${response.statusCode}");
//         print("${response.statusMessage}");
//         return left(ServerFailure(message:   'Unexpected status code:${response.statusCode}'));
//
//       }
//     }on ServerFailure catch(failure){
//       print("the error is${failure.message}");
//       return left(ServerFailure(message: failure.message));
//     }
//   }
//   @override
//   Future<Either<Failure, List<MovieModel>>>
//   getTopRatedMovies()async {
//     // TODO: implement getTopRatedMovies
//     try{
//       final response=await Dio().get(AppConstants.recommended);
//        if (response.statusCode == 200) {
//         List<MovieModel> movies = (response.data['results']
//         as List)
//             .map((item) => MovieModel.fromJson(item))
//             .toList();
//
//         return right(movies);
//       } else {
//         print("${response.statusCode}");
//         print("${response.statusMessage}");
//         return left(ServerFailure(message:   'Unexpected status code: ${response.statusCode}'));
//
//       }
//     }on ServerFailure catch(failure){
//       print("the error is${failure.message}");
//       return left(ServerFailure(message: failure.message));
//     }
//   }
//
// }
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/utils/errors/failure.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/errors/exceptions.dart';
import '../../../movie_detials/data_source/models/movie_detials_model.dart';
import '../../../movie_detials/data_source/models/recommendation_model.dart';
import '../../../movie_detials/domain/use_case/get_movie_detials_use_case.dart';
import '../../../movie_detials/domain/use_case/get_recommendation_use_case.dart';
import '../models/movie_model.dart';

abstract class BaseMovieDataSource{
  Future<Either<Failure,List<MovieModel>>>getPapularMovies();
  Future<Either<Failure,List<MovieModel>>>getNewReleaseMovies();
  Future<Either<Failure,List<MovieModel>>>getTopRatedMovies();
  Future<Either<Failure,MovieDetialsModel>>getMoviesDetials
      (MovieDetialsParameters movieDetialsParameters);
  Future<Either<Failure,List<RecommendationModel>>>getRecommendation
      (RecommendationParameters recommendationParameters);
}
class MovieRemoteDataSource extends BaseMovieDataSource{
 final Dio dio;

  MovieRemoteDataSource({required this.dio});
  @override
  Future<Either<Failure, List<MovieModel>>> getNewReleaseMovies() async{
 try{
   final response=await dio.get(AppConstants.newRelease);
   if(response.statusCode==200){
     List<MovieModel>movies= (response.data['results'] as List)
         .map((e) => MovieModel.fromJson(e)).toList();
   return right(movies);
   }
   else{
     return left(ServerFailure(message: "Server Error "));
   }
 } on ServerException catch(error){
   return left(ServerFailure(message: "throw Exception ${error.toString()}"));
 }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPapularMovies()async {
   try{
     final response=await dio.get(AppConstants.papular);
     if(response.statusCode==200){
       List<MovieModel>movies=(response.data["results"]as List).map((e) =>
           MovieModel.fromJson(e)).toList();
    return right(movies);
     }else{
return left(ServerFailure(message: "Error with Server"));
     }
   }on ServerException catch(error){
     return left(ServerFailure(message: "throw Exception ${error.toString()}"));
   }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies()async {
   try{
     final response=await dio.get(AppConstants.recommended);
     if(response.statusCode==200){
     List<MovieModel>movies=(response.data['results']as List).
     map((e) => MovieModel.fromJson(e)).toList();
     return right(movies);
     }else{
       return left(ServerFailure(message:
       "Error with Server"));
     }
   }on ServerException catch(error){
     return left(ServerFailure(message:
     "throw Exception ${error.toString()}"));
   }
  }

  @override
  Future<Either<Failure, MovieDetialsModel>> getMoviesDetials(
      MovieDetialsParameters parameters ) async{
  try{
    final response=await dio.get(AppConstants.movieDetialPath(parameters.id));

 if(response.statusCode==200){
   MovieDetialsModel model=  MovieDetialsModel.fromJson(response.data);
   return right(model);
 }else{
   return left(ServerFailure(message: "Error with Api Server"));
 }
  }on ServerFailure catch(error){
    return left(ServerFailure(message: "Throw Exceptions ${error.toString()}"));
  }
  }

  @override
  Future<Either<Failure, List<RecommendationModel>>>
  getRecommendation(RecommendationParameters recommendationParameters)async {
try{
  final response=await dio.get(AppConstants.getRecommendationPath(recommendationParameters.id));
  if(response.statusCode==200){
List<RecommendationModel>movies=
(response.data["results"]as List).map((e) =>
    RecommendationModel.fromJson(e)).toList();
return right (movies);
  }else{
    return left(ServerFailure(message: "Error with Api Server"));
  }
}
on ServerFailure catch(error){
  return left(ServerFailure(message:
  "Throw Exceptions ${error.toString()}"));

}
  }
}