import 'package:equatable/equatable.dart';

import '../../../core/utils/enum.dart';
import '../../domain/entities/movie_search.dart';

class SearchMovieState extends Equatable {
  final List<MovieSearch>searchMovies;
  final String searchErrorMessage;
  final RequestState searchMovieState;

  SearchMovieState({ this.searchMovies=const [],
     this.searchErrorMessage="",
     this.searchMovieState=RequestState.loading});
  SearchMovieState copyWith(
          {List<MovieSearch>? searchMovies,
          String? searchErrorMessage,
          RequestState? searchMovieState})=>SearchMovieState(
    searchMovies:searchMovies??this.searchMovies,
    searchErrorMessage: searchErrorMessage??this.searchErrorMessage,
    searchMovieState: searchMovieState??this.searchMovieState
  );
  @override
  List<Object> get props =>
      [searchMovies,
    searchErrorMessage,
    searchMovieState];


}