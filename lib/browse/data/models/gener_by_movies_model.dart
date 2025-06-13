
import '../../domain/entities/gener_by_movies.dart';

class GenerByMoviesModel extends GenerByMovies{
  GenerByMoviesModel({required super.image,
    required super.title,
    required super.originalTitle,
    required super.releaseDate,
    required super.id});
  factory GenerByMoviesModel.fromJson(Map<String,dynamic>json)=>
      GenerByMoviesModel(
        image: json["backdrop_path"] ?? "",
          title:json["title"],
          originalTitle: json["original_title"],
          releaseDate:json["release_date"],
          id: json["id"], );

}