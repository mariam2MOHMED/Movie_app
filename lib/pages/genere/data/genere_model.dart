import 'package:movie_app/pages/genere/data/genere.dart';

class GenereModel extends Genere{
  GenereModel({
    required super.backDropPath,
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.voteAverage
  });
  factory GenereModel.fromJson(Map<String,dynamic>json)=>GenereModel
    (backDropPath: json['backdrop_path'],
      id:json['id'],
      title: json['original_title'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),);
}