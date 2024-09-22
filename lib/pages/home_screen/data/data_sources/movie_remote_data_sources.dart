import 'package:dio/dio.dart';
import 'package:movie_app/pages/home_screen/data/models/movie_model.dart';

class MovieRemoteDataSources{
  Future<List<MovieModel>?>getPapularMovie()async{
 final dio=Dio();
  final response=await dio.get("https://api.themoviedb.org/3/movie/popular?language=en-US&api_key=ffc1f879898e670e13d37297ed30bbbc");
if(response.statusCode==200){

  return List<MovieModel>.from((response.data["results"]
  as List
  ).map((e) => MovieModel.fromJson(e)));
}else{


}
  }
}