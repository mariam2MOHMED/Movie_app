import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{
  MoviesEvent();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class GetPapulorMovieEvent extends MoviesEvent{

}
class GetNewReleaseMovieEvent extends MoviesEvent{

}
class GetRecommendedMovieEvent extends MoviesEvent{

}
