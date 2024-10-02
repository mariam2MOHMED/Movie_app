import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_events.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_state.dart';
import 'package:movie_app/pages/home_screen/data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/home_screen/data/repository/movie_repositry.dart';
import 'package:movie_app/pages/home_screen/view_model/new_release_movie.dart';
import 'package:movie_app/pages/home_screen/view_model/papular_view_model.dart';
import 'package:movie_app/pages/home_screen/view_model/recommended_view_model.dart';
import 'package:movie_app/pages/movie_Detials/view_model/base_view_model.dart';
import 'package:movie_app/shared/request.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesStates>{
  final GetPapularMovieViewModel getPapularMovieViewModel;
  final GetNewReleaseMovieEvent getNewReleaseMovieEvent
  =GetNewReleaseMovieEvent();
  final GetRecommendedMovieEvent getRecommendedMovieEvent
  =GetRecommendedMovieEvent();
  MoviesBloc(this.getPapularMovieViewModel,



      ):
        super(const MoviesStates()){

   on<GetPapulorMovieEvent>((event, emit)async {
     BaseMovieRemoteDataSources baseMovieRemoteDataSources=
     MovieRemoteDataSources();
     NoParameters noParameters=NoParameters();
     BaseMovieRepository baseMovieRepository=
     MovieRepositry(baseMovieRemoteDataSources);
  final res= await GetPapularMovieViewModel(baseMovieRepository).call(noParameters);
// print(res);
//   emit(MoviesStates(papularMoviesStates:RequestState.loaded ));

res.fold((l) =>emit(
  state.copyWith(
    papularMoviesStates: RequestState.error,
    papularMessage: l.message,
  )

) , (r)=>emit(
    state.copyWith(
      papularMoviesStates: RequestState.loaded,
papularMovies: r    )

) );
     });
/////
on<GetNewReleaseMovieEvent>((event, emit)async {
  BaseMovieRemoteDataSources baseMovieRemoteDataSources=
  MovieRemoteDataSources();
  NoParameters noParameters=NoParameters();
  BaseMovieRepository baseMovieRepository=
  MovieRepositry(baseMovieRemoteDataSources);
  final res=await GetNewReleaseMovieiewModel(baseMovieRepository).
  call(noParameters);
  res.fold((l) =>emit(
      state.copyWith(
          newReleeaseMessage: l.message,
          newReleeaseMoviesStates: RequestState.error
      )

  ) , (r)=>emit(
      state.copyWith(
          newReleeaseMoviesStates: RequestState.loaded,
          newReleeaseMovies: r
      )

  ) );
});

   on<GetRecommendedMovieEvent>((event, emit)async {
     BaseMovieRemoteDataSources baseMovieRemoteDataSources=
     MovieRemoteDataSources();
     NoParameters noParameters=NoParameters();
     BaseMovieRepository baseMovieRepository=
     MovieRepositry(baseMovieRemoteDataSources);
     final res=await GetRecommendedMoviesiewModel(baseMovieRepository).
     call(noParameters);
     res.fold((l) =>emit(
         state.copyWith(
             topRatedMessage: l.message,
             topRatedMoviesStates: RequestState.error
         )
       //     MoviesStates(
       //     newReleeaseMessage: l.message,
       //     newReleeaseMoviesStates: RequestState.error
       // )
     ) , (r)=>emit(
         state.copyWith(
             topRatedMoviesStates: RequestState.loaded,

             topRatedMovies: r,
         )
       //     MoviesStates(
       //     newReleeaseMoviesStates: RequestState.loaded,
       //
       //     newReleeaseMovies: r
       // )
     ) );
   });
  }
}