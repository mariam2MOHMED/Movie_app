import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/movie_detials/domain/use_case/get_recommendation_use_case.dart';
import 'package:moviesapp/movie_detials/presentation/controller/movie_detials_bloc/movie_detials_state.dart';
import 'package:moviesapp/movie_detials/presentation/controller/movie_detials_bloc/movies_detials_exent.dart';

import '../../../domain/use_case/get_movie_detials_use_case.dart';


class MovieDetialsBloc extends Bloc<MovieDetialsEvent,MovieDetialsState>{
  MovieDetialsBloc(this.getMovieDetialsUseCase,
      this.getRecommendationUseCase):super(MovieDetialsState()){
    on<GetMovieDetialsEvent>(_getMovieDetials);
    on<GetSimiliarMoviesEvent>(_getSimiliarMovie);
  }
final GetMovieDetialsUseCase getMovieDetialsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  Future<FutureOr<void>> _getMovieDetials(GetMovieDetialsEvent event,
      Emitter<MovieDetialsState> emit) async {
    final result=await getMovieDetialsUseCase(
        MovieDetialsParameters(id:
        event.id));
  result.fold((l) {
    emit(state.copyWith(
      movieDetialsMessage: l.message,
      movieDetialsState: RequestState.error
    ));
  }, (r) {
    emit(state.copyWith(
      movieDetialsState: RequestState.loaded,
      movieDetials: r
    ));
  });
  }

  FutureOr<void> _getSimiliarMovie(GetSimiliarMoviesEvent event,
      Emitter<MovieDetialsState> emit) async{
  final result=await  getRecommendationUseCase(RecommendationParameters
    (id: event.id));
  result.fold((l) {
    emit(state.copyWith(
      recommendationMessage: l.message,
        recommendationRequestState: RequestState.error
    ));
  }, (r) {
    emit(state.copyWith(
      recommendation: r,
        recommendationRequestState: RequestState.loaded
    ));
  });
  }
}