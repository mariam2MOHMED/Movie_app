import 'package:equatable/equatable.dart';

class MovieSearch extends Equatable {
  final int id;
  final String image;
  final String title;
  final String releaseDate;
  final String originalTitle;
  final List<int>genreIds;

  MovieSearch({required this.id,
    required this.image,
    required this.title,
    required this.releaseDate,
    required this.originalTitle,
    required this.genreIds});

  @override
  List<Object> get props =>
      [id,
        image,
        title,
        releaseDate,
        originalTitle,
        genreIds,];
}