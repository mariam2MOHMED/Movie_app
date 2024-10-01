import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/movie_Detials/data/models/movie_Detials_model.dart';
import 'package:movie_app/pages/movie_Detials/view_model/base_view_model.dart';
import 'package:movie_app/shared/error/failure.dart';

import '../data/models/movie_detials.dart';

class GetMovieDetialsViewModel extends BaseViewModel<MovieDetial,MovieDetialsParameter >{
 final BaseMovieRepository baseMovieRepository;
 GetMovieDetialsViewModel(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetial>> call(MovieDetialsParameter parameters) async{
    // TODO: implement call
  return await baseMovieRepository.getMovieDetials(parameters);
  }
}
class MovieDetialsParameter extends Equatable{
 final int movieId;
 MovieDetialsParameter({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}