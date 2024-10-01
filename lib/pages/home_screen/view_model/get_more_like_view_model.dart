import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/movie_Detials/data/models/more_like.dart';
import 'package:movie_app/pages/movie_Detials/view_model/base_view_model.dart';
import 'package:movie_app/shared/error/failure.dart';

class GetMoreLikeViewModel extends BaseViewModel<
    List<MoreLike>,MoreLikeParameters>{
  final BaseMovieRepository baseMovieRepository;
  GetMoreLikeViewModel(this.baseMovieRepository);
  @override
  Future<Either<Failure,  List<MoreLike>>>
  call(MoreLikeParameters parameters) async{
    // TODO: implement call
  return await baseMovieRepository.getMoreLikeMovies(parameters);
  }

}
class MoreLikeParameters extends Equatable{
  final int id;
  MoreLikeParameters(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}