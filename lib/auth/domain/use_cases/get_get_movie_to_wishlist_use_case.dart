import 'package:dartz/dartz.dart';


import '../../../core/utils/errors/error_firebase.dart';
import '../../../movies/domain/entities/movie.dart';
import '../repositry/base_auth_repositry.dart';

class GetGetMoviesToWishListUseCase{
  final BaseAuthRepositry baseAuthRepositry;

  GetGetMoviesToWishListUseCase({required this.baseAuthRepositry});
  Future<Either<ErrorFirebase,List<Movie>>> getMovieToWishList
      (String userId)async{
    return await baseAuthRepositry.getMovieToWishList(userId);
    ; }
}