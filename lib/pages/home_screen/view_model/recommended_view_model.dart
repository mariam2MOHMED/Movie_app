import 'package:dartz/dartz.dart';
import 'package:movie_app/pages/movie_Detials/view_model/base_view_model.dart';

import '../../../shared/error/failure.dart';
import '../data/models/movie.dart';
import '../data/repository/base_movie_repositry.dart';

class GetRecommendedMoviesiewModel extends BaseViewModel<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;
  GetRecommendedMoviesiewModel(this.baseMovieRepository);


  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    // TODO: implement call
    return await baseMovieRepository.getRecommendedMovie();
  }
}