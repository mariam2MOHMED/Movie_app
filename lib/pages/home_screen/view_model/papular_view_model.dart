import 'package:movie_app/pages/movie_Detials/view_model/base_view_model.dart';

import '../data/models/movie.dart';
import '../data/repository/base_movie_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/error/failure.dart';

class GetPapularMovieViewModel extends BaseViewModel<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;
  GetPapularMovieViewModel(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{

    return await baseMovieRepository.getPapularMovie();
  }
}