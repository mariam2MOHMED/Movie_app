

import 'movie.dart';

class MovieModel extends Movie{
  MovieModel({required super.id,
    required super.backdropPath,
    required super.genre_ids,
    required super.title,
   required super.posterPath,
    required super.overView,
    required super.voteAverage,
    required super.releaseData});
 factory MovieModel.fromJson(dynamic json)=>
     MovieModel(id: json['id'],
         backdropPath:json['backdrop_path'],
         posterPath: json['poster_path'],
         genre_ids: List<int>.from(json['genre_ids']),
         title: json['original_title'],
         overView: json['overview'],
         voteAverage: json['vote_average'].toDouble(),
         releaseData: json['release_date'],);

}