import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/utils/errors/failure.dart';
import 'package:moviesapp/search/domain/entities/movie_search.dart';
import 'package:moviesapp/search/domain/repositry/base_search_movie_repositry.dart';

class GetSearchMovieUseCase{
  final BaseSearchMovieRepositry searchMovieRepositry;

  GetSearchMovieUseCase({required this.searchMovieRepositry});
  Future<Either <Failure,List<MovieSearch>>>getSearch(String query)async{
    return await searchMovieRepositry.getSearch(query);
  }
}