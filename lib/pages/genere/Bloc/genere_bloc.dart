import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/genere/data/genere.dart';
import 'package:movie_app/shared/request.dart';

import '../view_model/genere_view_model.dart';

part 'genere_event.dart';
part 'genere_state.dart';

class GenereBloc extends Bloc<GenereEvent, GenereState> {
  GenereBloc(this.getGenereViewModel) : super(GenereState()) {
    on<GetGenereByMoviesEvent>(_getGenereByMovies);
  }
final GetGenereViewModel getGenereViewModel;
  FutureOr<void> _getGenereByMovies(GetGenereByMoviesEvent event,
      Emitter<GenereState> emit)async {
    final res=await getGenereViewModel(GenerParameters(event.id, event.name));
    res.fold((l) => emit(state.copyWith(
      genereState: RequestState.error,
      genereMessage: l.message
    )), (r) => emit(
      state.copyWith(
        genereState: RequestState.loaded,
        genere: r
      )
    ));
  }
}
