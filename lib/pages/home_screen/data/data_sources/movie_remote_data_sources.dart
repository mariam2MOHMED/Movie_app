import 'package:dio/dio.dart';

import 'package:movie_app/pages/browse/data/models/Browse_model.dart';
import 'package:movie_app/pages/browse/view_model/get_browse_view_model.dart';
import 'package:movie_app/pages/genere/data/genere_model.dart';
import 'package:movie_app/pages/genere/view_model/genere_view_model.dart';
import 'package:movie_app/pages/home_screen/api/api_constant.dart';
import 'package:movie_app/pages/home_screen/data/models/error_msg_model.dart';
import 'package:movie_app/pages/home_screen/data/models/movie_model.dart';
import 'package:movie_app/pages/home_screen/view_model/get_more_like_view_model.dart';
import 'package:movie_app/pages/movie_Detials/data/models/more_like_model.dart';
import 'package:movie_app/pages/movie_Detials/data/models/movie_detials.dart';
import 'package:movie_app/pages/movie_Detials/view_model/movie_detials_view_model.dart';
import 'package:movie_app/shared/error/excepcation.dart';

import '../../../movie_Detials/data/models/movie_Detials_model.dart';
import '../../../search/data/models/search_model.dart';
import '../../../search/view_model/get_search.dart';
abstract class BaseMovieRemoteDataSources{
  Future<List<MovieModel>>getPapularMovie();
  Future<List<MovieModel>>getNewReleaseMovie();
  Future<List<MovieModel>>getRecommendedMovie();
  Future<List<MoreLikeModel>>getMoreLikeMovies(
   MoreLikeParameters moreLikeParameters
      );
  Future<List<SearchModel>>getSearchMovies(
      SearchParameters searchParameters
      );
  Future<List<BrowseModel>>getBrowseMovies(
      );
  Future<List<GenereModel>>getGenereMovies(
      GenerParameters generParameters); 

  Future<MoveDetialsModel>getMovieDetials(MovieDetialsParameter movieDetialsParameter);
}
class MovieRemoteDataSources extends BaseMovieRemoteDataSources{
  @override
  Future<List<MovieModel>>getPapularMovie()async{
 final dio=Dio();
  final response=await dio
      .get(ApiConstant.popular);
  print(response);
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

  @override
  Future<MoveDetialsModel> getMovieDetials
      (MovieDetialsParameter movieDetialsParameter)async {
    final dio=Dio();
    final response=await dio.get(ApiConstant.movieDetialsPath(movieDetialsParameter.movieId));
    if(response.statusCode==200){

      return MoveDetialsModel.fromJson(response.data);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.
      fromJson(response.data));

    }
  }

  @override
  Future<List<MoreLikeModel>>
  getMoreLikeMovies(MoreLikeParameters moreLikeParameters)async {
    final dio = Dio();
    final response = await dio.get(ApiConstant.moreLikePath(
        moreLikeParameters.id));
    if (response.statusCode == 200) {
      return List<MoreLikeModel>.from((response.data["results"]
      as List
      ).map((e) => MoreLikeModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.
      fromJson(response.data));
    }
  }

  @override
  Future<List<SearchModel>> getSearchMovies(SearchParameters searchParameters) async{
    final dio = Dio();
    final response = await dio.get(ApiConstant.searchPath(searchParameters.query));
    if (response.statusCode == 200) {
      return List<SearchModel>.from((response.data["results"]
      as List
      ).map((e) => SearchModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.
      fromJson(response.data));
    }
  }

  @override
  Future<List<BrowseModel>> getBrowseMovies() async{
    final dio = Dio();
    final response = await dio.get(ApiConstant.geners);
    if (response.statusCode == 200) {
      return List<BrowseModel>.from((response.data["genres"]
      as List
      ).map((e) => BrowseModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.
      fromJson(response.data));
    }
  }

  @override
  Future<List<GenereModel>> getGenereMovies(GenerParameters generParameters) async{
    final dio = Dio();
    final response = await dio.get(ApiConstant.genersByMovies(generParameters.id));
    if (response.statusCode == 200) {
      return List<GenereModel>.from((response.data["results"]
      as List
      ).map((e) => GenereModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.
      fromJson(response.data));
    }
  }
}