
import 'package:moviesapp/movie_detials/data_source/models/genere_model.dart';
import 'package:moviesapp/movie_detials/domain/entities/movie_detials.dart';

class MovieDetialsModel extends MovieDetials{
  MovieDetialsModel({ super.image,
    required super.title,
    required super.id,
    required super.runTime,
    required super.releaseDate,
    required super.overView,
    required super.voteAverage,
    required super.geners,  super.posterImage});
  factory MovieDetialsModel.fromJson(Map<String,dynamic>json)=>
      MovieDetialsModel(
        posterImage: json["poster_path"]??"/jYfMTSiFFK7ffbY2lay4zyvTkEk.jpg",
      image: json["backdrop_path"]??"/nAxGnGHOsfzufThz20zgmRwKur3.jpg",
      title: json["title"],
      id: json["id"],
      runTime: json["runtime"],
      releaseDate:json["release_date"],
      overView:json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      geners: List<GenersModel>.from(json["genres"].map((e)=>GenersModel.fromJson(e))));
}