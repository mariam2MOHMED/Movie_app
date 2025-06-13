import 'package:dartz/dartz.dart';

import '../../../core/utils/errors/error_firebase.dart';
import '../../../movies/domain/entities/movie.dart';
import '../repositry/base_auth_repositry.dart';

class GetAddMovieToWishListUseCase{
  final BaseAuthRepositry baseAuthRepositry;

  GetAddMovieToWishListUseCase({required this.baseAuthRepositry});
  Future<Either<ErrorFirebase,Movie>>addMovieToWishList
      (Movie movieModel,String userId)async{
    return await baseAuthRepositry.addMovieToWishList
      (movieModel, userId)
 ; }
}