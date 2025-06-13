import 'package:dartz/dartz.dart';


import '../../../core/utils/errors/failure.dart';
import '../../domain/entities/gener_by_movies.dart';
import '../../domain/entities/genere_list.dart';
import '../../domain/repositry/base_genere_repositry.dart';
import '../data_source/genere_remote_data_source.dart';

class GenereListRepositry extends BaseGenereRepositry{
 final GenereDataSource genereDataSource;

  GenereListRepositry({required this.genereDataSource});
  @override
  Future<Either<Failure, List<GenereList>>> getGenerListMovies() async{
   return await genereDataSource.getGenersListMovies();
  }

  @override
  Future<Either<Failure, List<GenerByMovies>>> getGenerByMovies(int generMoviesId) async{
    // TODO: implement getGenerByMovies
   return await genereDataSource.getMoviesByGeners(generMoviesId);
  }

}