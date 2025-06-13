
import 'package:moviesapp/browse/domain/entities/genere_list.dart';

class GenereListModel extends GenereList{
  GenereListModel({required super.id,
    required super.name});
 factory GenereListModel.
 fromJson(Map<String,dynamic>json)=>
     GenereListModel(id: json["id"], name: json["name"]);
}