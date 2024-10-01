import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/pages/home_screen/view_model/get_more_like_view_model.dart';
import 'package:movie_app/pages/movie_Detials/data/models/more_like.dart';
import 'package:movie_app/pages/movie_Detials/data/models/movie_detials.dart';

import 'package:movie_app/shared/request.dart';

import '../view_model/movie_detials_view_model.dart';

part 'movie_detials_event.dart';
part 'movie_detials_state.dart';

class MovieDetialsBloc extends Bloc<MovieDetialsEvent, MovieDetialsState> {
  final GetMovieDetialsViewModel getMovieDetialsViewModel;
  final GetMoreLikeViewModel getMoreLikeViewModel;
  MovieDetialsBloc(this.getMovieDetialsViewModel,
      this.getMoreLikeViewModel
      ) : super(MovieDetialsState()) {
    on<GetMovieDetialsEvent>(_getMovieDetialsEvent);
    on<GetMovieMoreLikeEvent>(_getMovieMoreLikeEvent);
    //GetMovieMoreLikeEvent
  }

  FutureOr<void> _getMovieDetialsEvent(
      GetMovieDetialsEvent event, Emitter<MovieDetialsState> emit) async{
final res= await getMovieDetialsViewModel(
    MovieDetialsParameter(movieId: event.id));
 res.fold((l) => emit(
   state.copyWith(
   requestState: RequestState.error,
     message: l.message,
   )
 ), (r) => emit(
   state.copyWith(
     requestState: RequestState.loaded,
     movieDetial: r
   )
 ));
  }

  FutureOr<void> _getMovieMoreLikeEvent
      (GetMovieMoreLikeEvent event, Emitter<MovieDetialsState> emit)async
  {
    final res= await getMoreLikeViewModel(
        MoreLikeParameters ( event.id));
    res.fold((l) => emit(
        state.copyWith(
          moreLikeState: RequestState.error,
          moreLikeMessage: l.message,
        )
    ), (r) => emit(
        state.copyWith(
            moreLikeState: RequestState.loaded,
moreLikemovies: r
        )
    ));
  }
}

