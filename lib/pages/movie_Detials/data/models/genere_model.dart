import 'package:movie_app/pages/movie_Detials/data/models/Genere.dart';

class GenereModel extends Genere{
  GenereModel({required super.name,
    required super.id});
  factory GenereModel.fromJson(Map<String,dynamic>json)=>
      GenereModel(name: json['name'], id: json['id']);
}