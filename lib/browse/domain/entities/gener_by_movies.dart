import 'package:equatable/equatable.dart';

class GenerByMovies extends Equatable {
  final String? image;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final int id;

  GenerByMovies({required this.image,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.id});


  @override
  List<Object> get props => [image!,
    title,
    originalTitle,
    releaseDate,
    id];
}