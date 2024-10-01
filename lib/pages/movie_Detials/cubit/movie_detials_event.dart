part of 'movie_detials_bloc.dart';

@immutable
abstract class MovieDetialsEvent extends Equatable{
  const MovieDetialsEvent();
}
class GetMovieDetialsEvent extends MovieDetialsEvent{
  final int id;
  GetMovieDetialsEvent(this.id);
  @override

  // TODO: implement props
  List<Object?> get props => [id
  ];

}
class GetMovieMoreLikeEvent extends MovieDetialsEvent{
  final int id;
  GetMovieMoreLikeEvent(this.id);
  @override

  // TODO: implement props
  List<Object?> get props => [id
  ];

}