import 'package:equatable/equatable.dart';

abstract class MovieDetialsEvent extends Equatable{}
class GetMovieDetialsEvent extends MovieDetialsEvent{
  final int id;

  GetMovieDetialsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class GetSimiliarMoviesEvent extends MovieDetialsEvent{
  @override
  final int id;

  GetSimiliarMoviesEvent({required this.id});
  List<Object?> get props => [id];
}