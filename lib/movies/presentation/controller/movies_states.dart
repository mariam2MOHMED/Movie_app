import 'package:equatable/equatable.dart';

import '../../../core/utils/enum.dart';
import '../../domain/entities/movie.dart';


class MoviesState extends Equatable {
  final List<Movie>popularMovies;
  final RequestState popularRequestState;
  final String popularMessage;
  final List<Movie>newReleaseMovies;
  final RequestState newReleaseRequestState;
  final String newReleaseMessage;
  final List<Movie>topRatedMovies;
  final RequestState topRatedRequestState;
  final String topRatedMessage;
  MoviesState({
    this.popularMovies=const [],
    this.popularRequestState=RequestState.loading,
    this.popularMessage="",
    this.newReleaseMovies=const [],
    this.newReleaseRequestState=RequestState.loading,
    this.newReleaseMessage="",
    this.topRatedMovies=const [],
    this.topRatedRequestState=RequestState.loading,
    this.topRatedMessage="",
  });
  MoviesState copyWith({
     List<Movie>?popularMovies,
     RequestState? popularRequestState,
     String? popularMessage,
     List<Movie>?newReleaseMovies,
     RequestState? newReleaseRequestState,
     String? newReleaseMessage,
     List<Movie>?topRatedMovies,
     RequestState? topRatedRequestState,
     String? topRatedMessage,
}){
    return MoviesState(
      popularMovies: popularMovies??this.popularMovies,
      popularMessage:popularMessage??this.popularMessage,
      popularRequestState: popularRequestState??this.popularRequestState,
      newReleaseMovies: newReleaseMovies??this.newReleaseMovies,
      newReleaseRequestState: newReleaseRequestState??
          this.newReleaseRequestState,
      newReleaseMessage:newReleaseMessage??
          this.newReleaseMessage,
      topRatedMovies: topRatedMovies??this.topRatedMovies,
      topRatedRequestState: topRatedRequestState??this.topRatedRequestState,
      topRatedMessage: topRatedMessage??this.topRatedMessage
    );
  }
  @override
  List<Object> get props => [
    popularMovies,
    popularRequestState,
    popularMessage,
    newReleaseMovies,
    newReleaseRequestState,
    newReleaseMessage,
    topRatedMovies,
    topRatedMessage,
    topRatedRequestState
  ];
}
