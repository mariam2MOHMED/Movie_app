import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/movie_Detials/view_model/base_view_model.dart';
import 'package:movie_app/shared/error/failure.dart';

import '../data/models/search_class.dart';

class GetSearchViewModel extends BaseViewModel<List<Search>,SearchParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetSearchViewModel(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Search>>> call(SearchParameters parameters)async {
    // TODO: implement call
    return await baseMovieRepository.geSearchMovies(parameters);
  }

}
class SearchParameters extends Equatable{
  final String query;

  SearchParameters({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props =>[query];

}