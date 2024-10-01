import 'package:movie_app/pages/Search_page/data/models/search_class.dart';

class SearchModel extends Search{
   SearchModel(
      {
        super.backDropPath,
    required super.releaseDate,
        required super.id,
    required super.voteAverage, required super.title}
      );
  factory SearchModel.fromJson(Map<String,dynamic>json)=>SearchModel
    (backDropPath: json['backdrop_path']??"/8UVoeOPoLKS6h96zz6JzS6Tivo.jpg",
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    title: json['title'],
    id:json['id']

  );
}