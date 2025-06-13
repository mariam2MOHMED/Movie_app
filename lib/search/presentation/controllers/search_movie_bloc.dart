import 'package:bloc/bloc.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/search/presentation/controllers/search_movie_event.dart';
import 'package:moviesapp/search/presentation/controllers/search_movie_states.dart';

import '../../domain/use_case/get_search_movie_use_case.dart';

// class SearchMoviesBloc extends Bloc<SearchMovieEvent,SearchMovieState>{
//   final GetSearchMovieUseCase getSearchMovieUseCase;
//   SearchMoviesBloc(this.getSearchMovieUseCase):super(SearchMovieState()){
//   on<GetSearchMovieEvent>((event, emit) => getSearch);
//   }
//   Future<void>getSearch(GetSearchMovieEvent event,
//       Emitter<SearchMovieState> emit)async{
//     final result=await getSearchMovieUseCase.getSearch(event.query);
//     result.fold((l) {
//       emit(state.copyWith(
//           searchErrorMessage: l.message,
//           searchMovieState: RequestState.error
//       ));
//     }, (r) {
//       emit(state.copyWith(
//           searchMovies: r,
//           searchMovieState: RequestState.loaded
//       ));
//     });
//   }
// }
import 'package:bloc/bloc.dart';

import '../../domain/use_case/get_search_movie_use_case.dart';

class SearchMoviesBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovieUseCase getSearchMovieUseCase;

  SearchMoviesBloc(this.getSearchMovieUseCase) : super(SearchMovieState()) {
    on<GetSearchMovieEvent>(getSearch); // Correctly bind the event to the method
  }

  Future<void> getSearch(GetSearchMovieEvent event,
      Emitter<SearchMovieState> emit) async {
    emit(state.copyWith(searchMovieState: RequestState.loading)); // Emit loading state
    final result = await getSearchMovieUseCase.getSearch(event.query);
    result.fold(
          (l) => emit(state.copyWith(
        searchErrorMessage: l.message,
        searchMovieState: RequestState.error,
      )),
          (r) => emit(state.copyWith(
        searchMovies: r,
        searchMovieState: RequestState.loaded,
      )),
    );
  }
}