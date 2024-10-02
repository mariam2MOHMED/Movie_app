import 'package:movie_app/pages/browse/data/models/Browse.dart';

class BrowseModel extends Browse{
  BrowseModel({
    required super.id,
    required super.title,
 });
  factory BrowseModel.fromJson(Map<String,dynamic>json)=>
      BrowseModel(
          id:json['id'],
          title:json['name'],
      );
}