import 'package:movie_app/pages/movie_Detials/data/models/genere_model.dart';

import 'movie_detials.dart';

class MoveDetialsModel extends MovieDetial{
  MoveDetialsModel({required super.title,
     super.backDropPath,
     super.posterPath,
    required super.genre_ids,
    required super.id,
    required super.runTime,
    required super.voteAverage,
    required super.releaseData,
    required super.overView});
factory MoveDetialsModel.fromJson(Map<String,dynamic>json)=>
    MoveDetialsModel(title: json['original_title'],
        backDropPath:json['backdrop_path']??"/hZVIwxi6kK4KnpVPEWwdhG0cMM5.jpg",
        posterPath:json['poster_path']??"/94sIggRUBioP19m3vJQfV3lq6Z6.jpg",
        genre_ids: List<GenereModel>.from(
          json['genres'].map((e)=>GenereModel.fromJson(e))
        ),
        id: json['id'],
        runTime: json['runtime'],
        voteAverage: json['vote_average'],
        releaseData:json['release_date'],
        overView:json['overview'],);
}