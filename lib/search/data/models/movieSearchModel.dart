
// class MovieSearchModel extends MovieSearch{
//   MovieSearchModel({required super.id,
//     required super.image,
//     required super.title,
//     required super.releaseDate,
//     required super.originalTitle,
//     required super.genreIds});
//
//
//   factory  MovieSearchModel.fromJson( Map<String,dynamic>json)=>
//       MovieSearchModel(id: json["id"],
//         title:json["original_title"],
//         image: json["backdrop_path"],
//         genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
//         releaseDate: json["release_date"],
//         originalTitle: json["original_title"],);
// }
import 'package:moviesapp/search/domain/entities/movie_search.dart';

class MovieSearchModel extends MovieSearch {
  MovieSearchModel({
    required super.id,
    required super.image,
    required super.title,
    required super.releaseDate,
    required super.originalTitle,
    required super.genreIds,
  });

  factory MovieSearchModel.fromJson(Map<String, dynamic> json) {
    return MovieSearchModel(
      id: json["id"], // Fallback to "0" if id is null
      image: json["backdrop_path"] ?? "", // Fallback to empty string if null
      title: json["title"] ?? json["original_title"] ?? "Unknown", // Fallback to original_title or "Unknown"
      releaseDate: json["release_date"] ?? "", // Fallback to empty string
      originalTitle: json["original_title"] ?? "", // Fallback to empty string
      genreIds: json["genre_ids"] != null
          ? List<int>.from(json["genre_ids"])
          : [], // Fallback to empty list if null
    );
  }
}