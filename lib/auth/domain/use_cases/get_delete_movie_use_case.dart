import 'package:dartz/dartz.dart';

import '../../../core/utils/errors/error_firebase.dart';
import '../../../movies/domain/entities/movie.dart';
import '../repositry/base_auth_repositry.dart';

class GetDeleteMovieToWishListUseCase{
  final BaseAuthRepositry baseAuthRepositry;

  GetDeleteMovieToWishListUseCase({required this.baseAuthRepositry});
  Future<Either<ErrorFirebase,void>>deleteMovieFromWishList
      (String userId,Movie movie)async{
    return await baseAuthRepositry.deleteMovieFromWishList(userId, movie)
    ; }
}