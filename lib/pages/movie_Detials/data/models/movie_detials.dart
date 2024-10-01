import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/movie_Detials/data/models/Genere.dart';

class MovieDetial extends Equatable{
  final String title;
  final String? backDropPath;
  final int id;
  final List<Genere>genre_ids;
  final String? posterPath;
  final int runTime;
  final double voteAverage;
  final String releaseData;
  final String overView;

  MovieDetial({required this.title,
     this.backDropPath,
     this.posterPath,
    required this.genre_ids,
    required this.id,
    required this.runTime,
    required this.voteAverage,
    required this.releaseData,
    required this.overView});
  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    backDropPath,
    posterPath,
    genre_ids,
    title,
    overView,
    voteAverage,
    releaseData
  ];
}