import 'package:equatable/equatable.dart';

class Genere extends Equatable{
  final String name; final int id;

  Genere({required this.name, required this.id});
  List<Object?> get props => [name,id];
}