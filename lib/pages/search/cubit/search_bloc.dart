import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/shared/request.dart';

import '../data/models/search_class.dart';
import '../view_model/get_search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState> {
  SearchBloc(this.getSearchViewModel) : super(SearchState()) {
    on<GetSearchEvent>(_getSearch);
  }
final GetSearchViewModel getSearchViewModel;
  FutureOr<void> _getSearch(GetSearchEvent event, Emitter<SearchState> emit) async{
    final res=await getSearchViewModel(SearchParameters(query: event.query));
    res.fold((l) => emit(state.copyWith(
      searchState: RequestState.error,
      searchMessage: l.message
    )), (r) => emit(
      state.copyWith(
        searchState: RequestState.loaded,
        search: r
      )
    ));
  }
}
