import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/utils/errors/failure.dart';
import 'package:moviesapp/search/domain/repositry/base_search_movie_repositry.dart';


import '../../domain/entities/movie_search.dart';
import '../data_source/remote/search_movie_remote_data_source.dart';

class SearchMovieRepositry extends BaseSearchMovieRepositry{
final BaseSearchMovieRemoteDataSource baseSearchMovieRemoteDataSource;

  SearchMovieRepositry({required this.baseSearchMovieRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieSearch>>> getSearch(String query) async{
   return await baseSearchMovieRemoteDataSource.getSearch(query);
  }

}