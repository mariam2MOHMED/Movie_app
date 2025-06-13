import 'package:equatable/equatable.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/entities/Recommendation.dart';
import '../../../domain/entities/movie_detials.dart';

class MovieDetialsState extends Equatable {
  final MovieDetials? movieDetials;
  final RequestState movieDetialsState;
  final String movieDetialsMessage;
final List<Recommendation> recommendation;
final RequestState recommendationRequestState;
  final String recommendationMessage;
  @override
  List<Object?> get props =>
      [movieDetials, movieDetialsState, movieDetialsMessage,];

  MovieDetialsState({this.movieDetials,
    this.movieDetialsState = RequestState.loading,
    this.movieDetialsMessage = "",
  this.recommendation=const [],
    this.recommendationMessage="",
    this.recommendationRequestState=RequestState.loading

  });

  MovieDetialsState copyWith({
    MovieDetials? movieDetials,
    RequestState? movieDetialsState,
    String? movieDetialsMessage,
     List<Recommendation>? recommendation,
     RequestState? recommendationRequestState,
     String? recommendationMessage
  }) {
    return MovieDetialsState(
        movieDetials: movieDetials ?? this.movieDetials,
        movieDetialsState: movieDetialsState ?? this.movieDetialsState,
        movieDetialsMessage: movieDetialsMessage ?? this.movieDetialsMessage,
      recommendation: recommendation??this.recommendation,
      recommendationMessage:recommendationMessage??this.recommendationMessage,
      recommendationRequestState: recommendationRequestState??this.recommendationRequestState
    );
  }

}