import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/home_screen/data/models/movie.dart';
import 'package:movie_app/shared/request.dart';



class MoviesStates extends Equatable{
  final List<Movie> papularMovies;

  final RequestState papularMoviesStates;
  final String papularMessage;
  final List<Movie> newReleeaseMovies;
  final Movie? newReleaseMovie;
  final Movie? topRated;
  final RequestState newReleeaseMoviesStates;
  final String newReleeaseMessage;
  ////
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesStates;
  final String topRatedMessage;

  const MoviesStates({
  this.newReleaseMovie,
    this.topRated,
    this.papularMovies=const[],
    this.papularMoviesStates=RequestState.loading,
    this.papularMessage='',
    this.newReleeaseMovies=const[],
    this.newReleeaseMoviesStates=RequestState.loading,
    this.newReleeaseMessage='',
    //////
    this.topRatedMovies=const[],
    this.topRatedMoviesStates=RequestState.loading,
    this.topRatedMessage='',
  });
  MoviesStates copyWith({
     List<Movie>? papularMovies,
     RequestState? papularMoviesStates,
     String? papularMessage,
     List<Movie>? newReleeaseMovies,
    Movie? newReleaseMovie,
     RequestState? newReleeaseMoviesStates,
     String? newReleeaseMessage,
    /////
     List<Movie>? topRatedMovies,
     RequestState? topRatedMoviesStates,
     String? topRatedMessage,

  }){
    return MoviesStates(
      papularMovies: papularMovies??this.papularMovies,
      papularMessage: papularMessage??this.papularMessage,
      papularMoviesStates: papularMoviesStates??this.papularMoviesStates,
      newReleeaseMessage: newReleeaseMessage??this.newReleeaseMessage,
      newReleeaseMovies: newReleeaseMovies??this.newReleeaseMovies,
      newReleaseMovie: newReleaseMovie??this.newReleaseMovie,
      newReleeaseMoviesStates: newReleeaseMoviesStates??this.newReleeaseMoviesStates,
      ////
      topRatedMessage: topRatedMessage??this.topRatedMessage,
      topRatedMovies: topRatedMovies??this.topRatedMovies,
      topRatedMoviesStates: topRatedMoviesStates??this.topRatedMoviesStates
    );
}
  @override
  // TODO: implement props
  List<Object?> get props =>[
    papularMovies,
    newReleaseMovie,
    papularMoviesStates,papularMessage,
    newReleeaseMessage,newReleeaseMoviesStates,newReleeaseMovies,
    topRatedMoviesStates,topRatedMovies,topRatedMessage
  ];
}