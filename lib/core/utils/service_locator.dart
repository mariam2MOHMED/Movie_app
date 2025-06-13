import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moviesapp/browse/data/repositry/genere_list_repositry.dart';
import 'package:moviesapp/movie_detials/domain/use_case/get_movie_detials_use_case.dart';
import 'package:moviesapp/movies/data/repositry/movies_repositry.dart';
import 'package:moviesapp/movies/domain/repositry/base_movie_repositry.dart';
import 'package:moviesapp/movies/domain/use_cases/get_new_release_movies_use_case.dart';
import 'package:moviesapp/movies/domain/use_cases/get_top_rated_movies_use_case.dart';

import '../../auth/data/data_source/auth_remote_data_source.dart';
import '../../auth/data/repositry/auth_repositry.dart';
import '../../auth/domain/repositry/base_auth_repositry.dart';
import '../../auth/domain/use_cases/get_add_movie_to_wishlist_use_case.dart';
import '../../auth/domain/use_cases/get_delete_movie_use_case.dart';
import '../../auth/domain/use_cases/get_get_movie_to_wishlist_use_case.dart';
import '../../auth/domain/use_cases/get_login_use_case.dart';
import '../../auth/domain/use_cases/get_register_use_case.dart';
import '../../browse/data/data_source/genere_remote_data_source.dart';
import '../../browse/domain/repositry/base_genere_repositry.dart';
import '../../browse/domain/use_cases/get_gener_list_use_case.dart';
import '../../browse/domain/use_cases/get_movies_by_geners_use_case.dart';
import '../../movie_detials/domain/use_case/get_recommendation_use_case.dart';
import '../../movie_detials/presentation/controller/movie_detials_bloc/movie_detials_bloc.dart';
import '../../movies/data/data_source/movie_remote_data_source.dart';
import '../../movies/domain/use_cases/get_papular_movies_use_case.dart';

final getit=GetIt.instance;

void setUp() {
  //repos
  getit.registerLazySingleton<BaseMovieDataSource>(() =>
      MovieRemoteDataSource(dio: Dio()));
  getit.registerLazySingleton<BaseMoviesRepositry>(() =>
      MovieRepositry(
      baseMovieDataSource: getit<BaseMovieDataSource>
        ()));
  //
  getit.registerLazySingleton<MovieDetialsBloc>(() => MovieDetialsBloc(
      getit<GetMovieDetialsUseCase>(),    getit<GetRecommendationUseCase>()));
  getit.registerLazySingleton<BaseGenereRepositry>(() => GenereListRepositry
    (genereDataSource: getit<GenereDataSource>()));
  //data Source
  getit.registerLazySingleton<GenereDataSource>(() =>
      GenereRemoteDataSource());
  //use case
  getit.registerLazySingleton<GetPopularMoviesUseCase>(() =>
      GetPopularMoviesUseCase(
      baseMoviesRepositry: getit<BaseMoviesRepositry>()));
  getit.registerLazySingleton<GetTopRatedMoviesUseCase>(() =>
      GetTopRatedMoviesUseCase(
          baseMoviesRepositry: getit<BaseMoviesRepositry>()));
  getit.registerLazySingleton<GetNewReleaseMoviesUseCase>(() =>
      GetNewReleaseMoviesUseCase(
          baseMoviesRepositry: getit<BaseMoviesRepositry>()));
  getit.registerLazySingleton<GetMovieDetialsUseCase>(() =>
      GetMovieDetialsUseCase
    (baseMoviesRepositry: getit<BaseMoviesRepositry>()));
  getit.registerLazySingleton<GetRecommendationUseCase>(() =>
      GetRecommendationUseCase(baseMoviesRepositry:
      getit<BaseMoviesRepositry>()));
  getit.registerLazySingleton<GetGenerListUseCase>(() => GetGenerListUseCase
    (baseGenereListRepositry: getit<BaseGenereRepositry>()));
  getit.registerLazySingleton<GetMoviesByGenersUseCase>(() => GetMoviesByGenersUseCase(
      genereRepositry: getit<BaseGenereRepositry>()));
  getit.registerLazySingleton<GetAddMovieToWishListUseCase>(() 
  => GetAddMovieToWishListUseCase(baseAuthRepositry: getit<BaseAuthRepositry>()));
  getit.registerLazySingleton<GetGetMoviesToWishListUseCase>(()
  => GetGetMoviesToWishListUseCase(baseAuthRepositry: getit<BaseAuthRepositry>()));
getit.registerLazySingleton<GetDeleteMovieToWishListUseCase>(() =>
GetDeleteMovieToWishListUseCase(baseAuthRepositry: getit<BaseAuthRepositry>()));
  //auth
  getit.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource());
  getit.registerLazySingleton<BaseAuthRepositry>(() => AuthRepositry
    (authDataSource: getit<AuthDataSource>()));
getit.registerLazySingleton<GetRegisterUseCase>(() =>
    GetRegisterUseCase(baseAuthRepositry: getit<BaseAuthRepositry>()));
getit.registerLazySingleton<GetLoginUseCase>(() => GetLoginUseCase
  (baseAuthRepositry: getit<BaseAuthRepositry>()));


  //     AuthBloc(GetRegisterUseCase(
  //       baseAuthRepositry: AuthRepositry
  //         (authDataSource: AuthRemoteDataSource())),
  //       GetLoginUseCase(  baseAuthRepositry: AuthRepositry
  //         (authDataSource: AuthRemoteDataSource()))),

}