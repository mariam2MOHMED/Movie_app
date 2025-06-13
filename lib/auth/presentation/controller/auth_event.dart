

import 'package:equatable/equatable.dart';

import '../../../movies/domain/entities/movie.dart';
import '../../domain/entities/user.dart';

abstract class AuthEvent extends Equatable  {}
class GetRegisterEvent extends AuthEvent {
 final User user;

  GetRegisterEvent({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
class GetLoginEvent extends AuthEvent {
  final User user;

  GetLoginEvent({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
class GetAddMovieEvent extends AuthEvent {
  final String userId;
  final Movie movie;

  GetAddMovieEvent( {required this.movie, required this.userId,});
  @override
  // TODO: implement props
  List<Object?> get props => [movie,userId];
}
class GetDeleteMovieEvent extends AuthEvent {
  final String userId;
  final Movie movie;

  GetDeleteMovieEvent( {required this.movie, required this.userId,});
  @override
  // TODO: implement props
  List<Object?> get props => [movie,userId];
}
class GetGetMoviesEvent extends AuthEvent {
  final String userId;
  final List<Movie>? movies;

  GetGetMoviesEvent({required this.userId, this.movies, });
  @override
  // TODO: implement props
  List<Object?> get props => [userId,movies];
}
