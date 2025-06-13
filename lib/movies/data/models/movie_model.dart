// import 'package:moviecleanarch/movies/domain/entities/movie.dart';
//
// class MovieModel extends Movie{
//   MovieModel({required super.id,
//     required super.title,
//     required super.image,
//     required super.genersId,
//     required super.voteAverage,
//     required super.releaseDate});
//   factory MovieModel.fromJson(Map<String,dynamic>json)=>
//       MovieModel(id: json["id"],
//           title: json["original_title"],
//           image: json["backdrop_path"],
//           genersId: List<int>.from(json["genre_ids"].map((e)=>e)),
//           voteAverage: json["vote_average"].toDouble(),
//           releaseDate: json["release_date"]);
//
// }

import '../../domain/entities/movie.dart';

class MovieModel extends Movie{
  MovieModel({required super.id,
    required super.title,
    required super.originalTitle,
    required super.image,
    required super.genreIds,
     super.releaseDate,
    required super.voteAverage});
factory  MovieModel.fromJson( Map<String,dynamic>json)=>
       MovieModel(id: json["id"],
          title:json["title"],
          originalTitle: json["original_title"],
          image: json["backdrop_path"],
          genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
          releaseDate: json["release_date"]??"2019",
          voteAverage: json["vote_average"].toDouble(),);
  Map<String,dynamic>toJson()=>{
    "id":id,
    "title":title,
    "original_title":originalTitle,
    "backdrop_path":image,
    "genre_ids":genreIds,
    "release_date":releaseDate,
    "vote_average":voteAverage,
  };
}