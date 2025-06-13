import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? image;
  final double? voteAverage;
  final int id;
  final String? title;
  final String? releaseDate;

  Recommendation({ this.image,
     this.voteAverage,
    required this.id,
     this.title,
     this.releaseDate});

  @override
  List<Object?> get props =>
      [image!, voteAverage!, id, title!, releaseDate!];
}