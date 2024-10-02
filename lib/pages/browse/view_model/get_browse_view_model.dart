import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/browse/data/models/Browse.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/movie_Detials/view_model/base_view_model.dart';
import 'package:movie_app/shared/error/failure.dart';

class GetBrowseViewModel {
  final BaseMovieRepository baseMovieRepository;

  GetBrowseViewModel( this.baseMovieRepository);

  @override
  Future<Either<Failure, dynamic>> call() {
    // TODO: implement call
return baseMovieRepository.getBrowseMovies();
  }


  }

class BrowseParameters extends Equatable{
  final int id;

  BrowseParameters(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}