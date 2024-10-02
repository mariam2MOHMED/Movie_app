
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/browse/view_model/get_browse_view_model.dart';
import 'package:movie_app/shared/request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/Browse.dart';

part 'browse_event.dart';
part 'browse_state.dart';

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseBloc(this.getBrowseViewModel) : super(BrowseState()) {
    on<BrowseEvent>( _getBrowse);
  }
  GetBrowseViewModel getBrowseViewModel;
  // FutureOr<void> _getBrowse(GetBrowseEvent event, Emitter<BrowseState> emit) async{
  //   final res=await GetBrowseViewModel;
  //   res.fold((l) => emit(state.copyWith(
  //       searchState: RequestState.error,
  //       searchMessage: l.message
  //   )), (r) => emit(
  //       state.copyWith(
  //           searchState: RequestState.loaded,
  //           search: r
  //       )
  //   ));


  FutureOr<void> _getBrowse
      (BrowseEvent event, Emitter<BrowseState> emit)async {
 final res=await getBrowseViewModel.call();
 res.fold((l) => emit(state.copyWith(
   browseMessage: l.message,
   browseState: RequestState.error
 )), (r) => emit(
   state.copyWith(
     browse: r,
     browseState: RequestState.loaded
   )
 ));
  }
}
