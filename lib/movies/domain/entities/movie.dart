// import 'package:equatable/equatable.dart';
//
// class Movie extends Equatable{
//   final int id;
//   final String title;
//   final String image;
//   final List<int>genersId;
//   final String releaseDate;
//   final double voteAverage;
//
//   Movie(
//       {
//         required this.id,
//         required this.title,
//         required this.image,
//         required this.genersId,
//         required this.voteAverage,
//         required this.releaseDate
//       });
//
//   @override
//   List<Object> get props =>
//       [  id,
//          title,
//          image,
//          genersId,
//          releaseDate,
//          voteAverage];
//
// }
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String originalTitle;
  final String image;
  final List<int>genreIds;
  final String? releaseDate;
  final double voteAverage;

  Movie( {required this.id,
    required this.originalTitle,
    required this.title,
    required this.image,
    required this.genreIds,
     this.releaseDate,
    required this.voteAverage});

  @override
  List<Object> get props =>
      [  id,
        title,
        originalTitle,
        image,
        genreIds,
        releaseDate!,
        voteAverage,];


}