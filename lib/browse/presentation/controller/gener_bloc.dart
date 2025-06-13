import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:moviesapp/browse/domain/entities/gener_by_movies.dart';
import 'package:moviesapp/core/utils/use_case/base_use_case.dart';

import '../../../core/utils/enum.dart';
import '../../domain/entities/genere_list.dart';
import '../../domain/use_cases/get_gener_list_use_case.dart';
import '../../domain/use_cases/get_movies_by_geners_use_case.dart';

part 'gener_event.dart';
part 'gener_state.dart';

class GenerBloc extends Bloc<GenerEvent, GenerState> {
 final GetGenerListUseCase generListUseCase;
 final GetMoviesByGenersUseCase getMoviesByGenersUseCase;
  GenerBloc(this.generListUseCase, this.getMoviesByGenersUseCase) : super(GenerState()) {
    on<GetGenerListEvent>(_getGenerList);
    on<GetMoviesByGenersEvent>(_getMoviesByGeners);
  }
 Future<FutureOr<void>> _getGenerList(GetGenerListEvent event, Emitter<GenerState> emit) async {
 final result=await generListUseCase(NoParameters());
 result.fold((l) {
   emit(state.copyWith(
     generListMessage: l.message,
       generListState: RequestState.error
   ));
 }, (r) {
   emit(state.copyWith(
    genersList: r,
       generListState: RequestState.loaded
   ));
 });
  }

  FutureOr<void> _getMoviesByGeners(GetMoviesByGenersEvent event,
      Emitter<GenerState> emit) async{
  final result=await getMoviesByGenersUseCase(GenerByMovieParameters
    (id: event.generByMovieId));
  result.fold((l) {
    emit(state.copyWith(
        moviesByGenersMessage: l.message,moviesByGenersState: RequestState.error
    ));
  }, (r){
    emit(state.copyWith(
   moviesByGeners: r,moviesByGenersState: RequestState.loaded
    ));
  });
  }
}
