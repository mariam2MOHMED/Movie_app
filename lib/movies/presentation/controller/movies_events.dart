// import 'package:equatable/equatable.dart';
//
// abstract class MoviesEvents extends Equatable {
//   const MoviesEvents();
//
//   @override
//   List<Object> get props => [];
// }
// class GetPapularMoviesEvent extends MoviesEvents{}
// class GetNewReleaseMoviesEvent extends MoviesEvents{}
// class GetTopRatedMoviesEvent extends MoviesEvents{}
import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetPopularMoviesEvent extends MoviesEvent{}
class GetNewReleaseMoviesEvent extends MoviesEvent{}
class GetTopRatedMoviesEvent extends MoviesEvent{}