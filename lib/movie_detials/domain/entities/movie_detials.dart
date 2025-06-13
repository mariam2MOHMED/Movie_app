import 'package:equatable/equatable.dart';
import 'package:moviesapp/movie_detials/domain/entities/geners.dart';

class MovieDetials extends Equatable {
  final String? image;
  final int id;
  final int runTime;
  final String title;
  final String releaseDate;
  final String overView;
  final double voteAverage;
  final List<Geners>geners;
final String? posterImage;
  MovieDetials({ this.posterImage,  this.image,
    required this.title,
    required this.id,
    required this.runTime,
    required this.releaseDate,
    required this.overView,
    required this.voteAverage,
    required this.geners});

  @override
  List<Object> get props =>
      [id,
        image!,
        posterImage!,
        runTime,
        title,
        releaseDate,
        overView,
        voteAverage,
        geners,];
}