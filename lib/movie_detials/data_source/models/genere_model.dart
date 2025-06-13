import 'package:moviesapp/movie_detials/domain/entities/geners.dart';

class GenersModel extends Geners{
  GenersModel(
      {required super.id,
        required super.name});
  factory GenersModel.fromJson(Map<String,dynamic>json)=>
      GenersModel(id: json["id"], name: json["name"],);
}