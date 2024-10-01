import 'package:movie_app/pages/movie_Detials/data/models/more_like.dart';

class MoreLikeModel extends MoreLike{
  MoreLikeModel({required super.id,
     super.backdropPath,
    required super.title,
    required super.releaseData,
    required super.voteAverage});
factory MoreLikeModel.fromJson(Map<String,dynamic>json)=>
    MoreLikeModel(id: json['id']??"1012148",
        backdropPath:json['backdrop_path']?? "/hZVIwxi6kK4KnpVPEWwdhG0cMM5.jpg",
        title:json['original_title']??"Chapel",
      releaseData: json['release_date']??"2019",
        voteAverage: json['vote_average'].toDouble()??"5.8",
    );
}