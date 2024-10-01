import 'package:equatable/equatable.dart';

class MoreLike extends Equatable{
  final int id;
  final String? backdropPath;

  final String? title;
  final String? releaseData;
  final double? voteAverage;

  MoreLike({
    required this.id,
     this.backdropPath,
    required this.title,
    required this.releaseData,
    required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    backdropPath,
    title,
    releaseData,
    voteAverage
  ];

}