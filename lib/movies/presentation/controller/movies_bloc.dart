// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:moviecleanarch/core/utils/enum.dart';
// import 'package:moviecleanarch/movies/data/data_source/movie_remote_data_source.dart';
// import 'package:moviecleanarch/movies/data/repositry/movies_repositry.dart';
// import 'package:moviecleanarch/movies/domain/repositry/base_movie_repositry.dart';
// import 'package:moviecleanarch/movies/domain/use_cases/get_new_release_movies_use_case.dart';
// import 'package:moviecleanarch/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
// import 'package:moviecleanarch/movies/presentation/controller/movies_events.dart';
// import 'package:moviecleanarch/movies/presentation/controller/movies_states.dart';
//
// import '../../domain/use_cases/get_papular_movies_use_case.dart';
// class MovieBloc extends Bloc<MoviesEvents,MoviesState>{
//   final GetPopularMoviesUseCase getPopularMoviesUseCase;
//   final GetNewReleaseMoviesUseCase getNewReleaseMoviesUseCase;
//   final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
//   MovieBloc(this.getPopularMoviesUseCase,
//       this.getNewReleaseMoviesUseCase,
//       this.getTopRatedMoviesUseCase):super(MoviesState()){
//     on<GetPapularMoviesEvent>((event, emit)
//     async{
//       print("Triggered GetPapularMoviesEvent");
//       final result=await getPopularMoviesUseCase
//         .
//       getPopularMovies();
//     result.fold((l) {
//       emit(
//           state.copyWith(popularRequestState: RequestState.error,
//
//               popularMessage: l.message)
//          );
//     }, (r) {
//       emit(
//           state.copyWith(popularRequestState: RequestState.loaded,
//               popularMovies: r)
//          );
//     });
// print(result);
//     });
//     on<GetNewReleaseMoviesEvent>((event, emit)async {
//      emit(state.copyWith(newReleaseRequestState: RequestState.loading));
//       final result=await getNewReleaseMoviesUseCase.
//       getNewReleaseMovies();
//       result.fold((l) {
//         emit(
//             state.copyWith(
//                 newReleaseMessage: l.message,
//    newReleaseRequestState: RequestState.error
//             ));
//       }, (r) {
//         emit(
//             state.copyWith(
//                 newReleaseMovies: r,
//                 newReleaseRequestState: RequestState.loaded
//             )
//           );
//         print("Triggered GetPapularMoviesEvent!!!!");
//         print("result ${result}");
//       });
//     });
//     on<GetTopRatedMoviesEvent>((event, emit) async{
//       final result=await getTopRatedMoviesUseCase.
//       getTopRatedMovies();
//       result.fold((l) {
//         emit(state.copyWith(
//           topRatedMessage: l.message,
//             topRatedRequestState: RequestState.error
//         ));
//       }, (r)
//       {
//         emit(state.copyWith(
//           topRatedMovies: r,topRatedRequestState: RequestState.loaded
//         ));
//       });
//     });
//
//   }
//
//
//
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/movies/presentation/controller/movies_events.dart';
import 'package:moviesapp/movies/presentation/controller/movies_states.dart';
import '../../../core/utils/use_case/base_use_case.dart';
import '../../domain/use_cases/get_new_release_movies_use_case.dart';
import '../../domain/use_cases/get_papular_movies_use_case.dart';
import '../../domain/use_cases/get_top_rated_movies_use_case.dart';

class MovieBloc extends Bloc<MoviesEvent,MoviesState>{
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetNewReleaseMoviesUseCase getNewReleaseMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MovieBloc(this.getPopularMoviesUseCase,
      this.getNewReleaseMoviesUseCase,
      this.getTopRatedMoviesUseCase):super(MoviesState()){
    on<GetPopularMoviesEvent>((event, emit)async {
      final result=await getPopularMoviesUseCase(NoParameters());
      result.fold((l) {
        emit(state.copyWith(
          popularRequestState: RequestState.error,
          popularMessage: l.message
        ));
      }, (r) {
        emit(state.copyWith(
          popularMovies: r,
          popularRequestState: RequestState.loaded
        ));
      });
    });
    on<GetNewReleaseMoviesEvent>((event, emit) async{
      final result=await getNewReleaseMoviesUseCase( NoParameters());
   result.fold((l) {
     emit(state.copyWith(
       newReleaseMessage: l.message,
       newReleaseRequestState: RequestState.error
     ));
   }, (r) {
     emit(state.copyWith(
         newReleaseMovies: r,
         newReleaseRequestState: RequestState.loaded
     ));
   });
    });
    on<GetTopRatedMoviesEvent>((event, emit) async{
      final result=await getTopRatedMoviesUseCase(NoParameters());
      result.fold((l) {
        emit(state.copyWith(
            topRatedMessage: l.message,
            topRatedRequestState: RequestState.error
        ));
      }, (r) {
        emit(state.copyWith(
            topRatedMovies: r,
            topRatedRequestState: RequestState.loaded
        ));
      });
    });
  }
}