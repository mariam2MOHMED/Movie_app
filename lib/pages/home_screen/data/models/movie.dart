
import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String backdropPath;
  final String posterPath;
  //posterPath
  final List<int> genre_ids;
  final String title;
  final String overView;
  final double voteAverage;
  final String releaseData;
const  Movie({
    required this.id,
    required this.backdropPath,
   required this.posterPath,
    required this.genre_ids,
    required this.title,
    required this.overView,
    required this.voteAverage,


  required this.releaseData,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    backdropPath,
    posterPath,
   genre_ids,
    title,
    overView,
    voteAverage,
    releaseData
  ];


}

