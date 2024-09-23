import 'package:dio/dio.dart';
import 'package:movie_app/pages/home_screen/api/api_constant.dart';
import 'package:movie_app/pages/home_screen/data/models/error_msg_model.dart';
import 'package:movie_app/pages/home_screen/data/models/movie_model.dart';
import 'package:movie_app/shared/error/excepcation.dart';
abstract class BaseMovieRemoteDataSources{
  Future<List<MovieModel>>getPapularMovie();
  Future<List<MovieModel>>getNewReleaseMovie();
  Future<List<MovieModel>>getRecommendedMovie();
}
class MovieRemoteDataSources extends BaseMovieRemoteDataSources{
  @override
  Future<List<MovieModel>>getPapularMovie()async{
 final dio=Dio();
  final response=await dio
      .get(ApiConstant.popular);
if(response.statusCode==200){

  return List<MovieModel>.from((response.data["results"]
  as List
  ).map((e) => MovieModel.fromJson(e)));
}else{
throw ServerException(errorMessageModel: ErrorMessageModel.
fromJson(response.data));

}
  }

  @override
  Future<List<MovieModel>> getNewReleaseMovie() async{
   final dio=Dio();
   final response=await dio.get(ApiConstant.upcomming);
   if(response.statusCode==200){

     return List<MovieModel>.from((response.data["results"]
     as List
     ).map((e) => MovieModel.fromJson(e)));
   }else{
     throw ServerException(errorMessageModel: ErrorMessageModel.
     fromJson(response.data));

   }
  }

  @override
  Future<List<MovieModel>> getRecommendedMovie()async {
    final dio=Dio();
    final response=await dio.get(ApiConstant.topRated);
    if(response.statusCode==200){

      return List<MovieModel>.from((response.data["results"]
      as List
      ).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.
      fromJson(response.data));

    }
  }
}