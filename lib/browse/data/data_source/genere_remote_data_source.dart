import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/browse/data/models/gener_by_movies_model.dart';
import 'package:moviesapp/core/utils/app_constants.dart';

import '../../../core/utils/errors/failure.dart';
import '../models/genere_list_model.dart';


abstract class GenereDataSource{
  Future<Either <Failure,List<GenereListModel>>>getGenersListMovies();
  Future<Either <Failure,List<GenerByMoviesModel>>>getMoviesByGeners(int generMoviesId);
}
class GenereRemoteDataSource extends GenereDataSource{

  @override
  Future<Either<Failure, List<GenereListModel>>> getGenersListMovies() async{
   try{
     final response=await Dio().get(AppConstants.browse);
     if(response.statusCode==200){
       List<GenereListModel>geners=(response.data["genres"] as List).
       map((e) => GenereListModel.fromJson(e)).toList();
       return right(geners);
     }else{
return left(ServerFailure(message: "Error With Api Server"));
     }
   }on ServerFailure catch(error){
     return left(ServerFailure(message: "throw Exception ${error.message}"));
   }
  }

  @override
  Future<Either<Failure, List<GenerByMoviesModel>>> getMoviesByGeners
      (int generMoviesId)async {
    try{
      final response=await Dio().get(AppConstants.generByMovies(generMoviesId));
      if(response.statusCode==200){
        List<GenerByMoviesModel> movies=(response.data["results"]as List).
        map((e) => GenerByMoviesModel.fromJson(e)).toList();
     return right(movies);
      }else{
        return left(ServerFailure(message: "Error With Api Server"));
      }

    }on ServerFailure catch(error){
      return left(ServerFailure(
          message: "throw Exception ${error.message}"));
    }
  }


}