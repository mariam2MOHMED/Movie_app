import '../data/models/movie.dart';
import '../data/repository/base_movie_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/error/failure.dart';

class GetPapularMovieViewModel{
  final BaseMovieRepository baseMovieRepository;
  GetPapularMovieViewModel(this.baseMovieRepository);
  Future<Either<Failure,List<Movie>>> extxute()async{
    return await baseMovieRepository.getPapularMovie();
  }
}