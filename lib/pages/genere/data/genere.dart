import 'package:equatable/equatable.dart';

class Genere extends Equatable{
  final String backDropPath;
  final int id;
  final String title;
  final String releaseDate;
  final double voteAverage;

  Genere({
    required this.backDropPath,
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.voteAverage});
  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    backDropPath,
    title,
    releaseDate,
    voteAverage
  ];

}