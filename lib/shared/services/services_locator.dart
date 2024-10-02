import 'package:get_it/get_it.dart';

import 'package:movie_app/pages/browse/bloc/browse_bloc.dart';
import 'package:movie_app/pages/browse/view_model/get_browse_view_model.dart';
import 'package:movie_app/pages/genere/Bloc/genere_bloc.dart';
import 'package:movie_app/pages/genere/view_model/genere_view_model.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_bloc.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_events.dart';
import 'package:movie_app/pages/home_screen/data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/home_screen/data/repository/movie_repositry.dart';
import 'package:movie_app/pages/home_screen/view_model/get_more_like_view_model.dart';
import 'package:movie_app/pages/home_screen/view_model/new_release_movie.dart';
import 'package:movie_app/pages/home_screen/view_model/papular_view_model.dart';
import 'package:movie_app/pages/home_screen/view_model/recommended_view_model.dart';
import 'package:movie_app/pages/movie_Detials/view_model/movie_detials_view_model.dart';

import '../../pages/movie_Detials/cubit/movie_detials_bloc.dart';
import '../../pages/search/cubit/search_bloc.dart';
import '../../pages/search/view_model/get_search.dart';

final sl = GetIt.instance;
class ServicesLocator{
   void init(){
     sl.registerFactory(() => MoviesBloc(sl()

     ));
     sl.registerFactory(() => MovieDetialsBloc(sl()
,sl()
     ));
     sl.registerFactory(() => SearchBloc(sl()));
     sl.registerFactory(() => BrowseBloc(sl()));
     sl.registerFactory(() => GenereBloc(sl()));
     //
    sl.registerLazySingleton(() => GetPapularMovieViewModel
      (sl()));
     sl.registerLazySingleton(() => GetNewReleaseMovieiewModel(sl()));

     sl.registerLazySingleton(() => GetRecommendedMoviesiewModel(sl()));
     sl.registerLazySingleton(() => GetMovieDetialsViewModel(sl()));
     sl.registerLazySingleton(() => GetMoreLikeViewModel(sl()));
     sl.registerLazySingleton(() => GetBrowseViewModel(sl()));
     sl.registerLazySingleton(() => GetGenereViewModel(sl()));
     sl.registerLazySingleton(() => GetSearchViewModel
       (sl()));
     //data source
  sl.registerLazySingleton<BaseMovieRepository>(() =>
      MovieRepositry(sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSources>
      (() => MovieRemoteDataSources());
  }
}