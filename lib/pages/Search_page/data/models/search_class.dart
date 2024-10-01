import 'package:equatable/equatable.dart';

class Search extends Equatable{
  final int id;
  final String? backDropPath;
  final String releaseDate;
  final String title;
  final double voteAverage;

  Search({
    required this.id,
    this.backDropPath,
    required this.title,
    required this.releaseDate,
    required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [
    backDropPath,
    releaseDate,
    voteAverage
  ];

}