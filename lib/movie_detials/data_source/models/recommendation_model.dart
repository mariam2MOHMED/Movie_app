
import 'package:moviesapp/movie_detials/domain/entities/Recommendation.dart';

class RecommendationModel extends Recommendation{
  RecommendationModel({ super.image,
     super.voteAverage,
    required super.id,
     super.title,
     super.releaseDate});
 factory RecommendationModel.fromJson(
     Map<String,dynamic>json)=>RecommendationModel
   (image: json!["backdrop_path"]??"/nAxGnGHOsfzufThz20zgmRwKur3.jpg",
     voteAverage: json["vote_average"].toDouble()??7.8,
     id: json["id"],
     title: json["title"]??"unKnown",
     releaseDate: json["release_date"]??"201");
}