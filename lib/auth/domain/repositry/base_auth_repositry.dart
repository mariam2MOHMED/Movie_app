import 'package:dartz/dartz.dart';


import '../../../core/utils/errors/error_firebase.dart';
import '../../../movies/domain/entities/movie.dart';
import '../entities/user.dart';

abstract class BaseAuthRepositry{
  Future<Either<ErrorFirebase,User>>login
      (String email, String password);
  Future<Either<ErrorFirebase,User>>register({required String name,
    required String email,required String password});
  Future<Either<ErrorFirebase,Movie>>addMovieToWishList
      (Movie movieModel,String userId);
  Future<Either<ErrorFirebase,List<Movie>>>getMovieToWishList
      (String userId);
  Future<Either<ErrorFirebase,void>>deleteMovieFromWishList
      (String userId,Movie movie);
}