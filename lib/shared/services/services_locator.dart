import 'package:get_it/get_it.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_bloc.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_events.dart';
import 'package:movie_app/pages/home_screen/data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/home_screen/data/repository/movie_repositry.dart';
import 'package:movie_app/pages/home_screen/view_model/new_release_movie.dart';
import 'package:movie_app/pages/home_screen/view_model/papular_view_model.dart';
import 'package:movie_app/pages/home_screen/view_model/recommended_view_model.dart';

final sl = GetIt.instance;
class ServicesLocator{
   void init(){
     sl.registerFactory(() => MoviesBloc(sl()

     ));
     //
    sl.registerLazySingleton(() => GetPapularMovieViewModel
      (sl()));
     sl.registerLazySingleton(() => GetNewReleaseMovieiewModel(sl()));

     sl.registerLazySingleton(() => GetRecommendedMoviesiewModel(sl()));
    //data source
  sl.registerLazySingleton<BaseMovieRepository>(() =>
      MovieRepositry(sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSources>
      (() => MovieRemoteDataSources());
  }
}