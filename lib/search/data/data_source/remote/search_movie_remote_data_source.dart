import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/utils/app_constants.dart';
import 'package:moviesapp/search/data/models/movieSearchModel.dart';

import '../../../../core/utils/errors/failure.dart';


abstract class BaseSearchMovieRemoteDataSource {
  Future<Either<Failure,List<MovieSearchModel>>>getSearch(String query);
}
class  SearchMovieRemoteDataSource extends BaseSearchMovieRemoteDataSource{



  @override
  Future<Either<Failure, List<MovieSearchModel>>> getSearch
      (String query) async{
try{
  final response=await Dio().get(AppConstants.getSearch(query));
 if(response.statusCode==200){

   List<MovieSearchModel>movies=(response.data['results'] as List)
       .map((e) => MovieSearchModel.fromJson(e)).toList();
   return right(movies);
 }else{
   return left(ServerFailure(message: "Error with Api Server"));
 }
}on ServerFailure catch(error){
  return left(ServerFailure(message: "throw Exception ${error.message}"));
}
  }

}