import 'package:dartz/dartz.dart';

import '../../../core/utils/errors/error_firebase.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositry/base_auth_repositry.dart';
import '../data_source/auth_remote_data_source.dart';


class AuthRepositry extends BaseAuthRepositry{
  final AuthDataSource authDataSource;

  AuthRepositry({required this.authDataSource});
  @override
  Future<Either<ErrorFirebase, User>> login(String email,
      String password)async {
   return await authDataSource.login(email, password);
  }

  @override
  Future<Either<ErrorFirebase, User>> register
      ({required String name, required String email,
    required String password}) async{
    // TODO: implement register
    return await authDataSource.register(name: name, email: email, password: password);
  }

  @override
  Future<Either<ErrorFirebase, Movie>> addMovieToWishList
      (Movie movieModel, String userId)async {
    // TODO: implement addMovieToWishList
 return await authDataSource.addMovieToWishList
   (movieModel, userId);
  }

  @override
  Future<Either<ErrorFirebase, List<Movie>>>
  getMovieToWishList(String userId)async {
    // TODO: implement getMovieToWishList
    return await authDataSource.getMovieToWishList(userId);
  }

  @override
  Future<Either<ErrorFirebase, void>> deleteMovieFromWishList(String
  userId, Movie movie) async{
  return await authDataSource.deleteMovieFromWishList(userId,movie);
  }
}