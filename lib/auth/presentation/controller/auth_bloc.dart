import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:moviesapp/auth/presentation/controller/auth_event.dart';
import 'package:moviesapp/auth/presentation/controller/auth_state.dart';


import '../../../core/utils/enum.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../domain/use_cases/get_add_movie_to_wishlist_use_case.dart';
import '../../domain/use_cases/get_delete_movie_use_case.dart';
import '../../domain/use_cases/get_get_movie_to_wishlist_use_case.dart';
import '../../domain/use_cases/get_login_use_case.dart';
import '../../domain/use_cases/get_register_use_case.dart';




class AuthBloc extends Bloc<AuthEvent,AuthState> {
  final GetRegisterUseCase getRegisterUseCase;
  final GetLoginUseCase getLoginUseCase;
  final GetAddMovieToWishListUseCase getAddMovieToWishListUseCase;
 final GetGetMoviesToWishListUseCase getGetMoviesToWishListUseCase;
 final GetDeleteMovieToWishListUseCase getDeleteMovieToWishListUseCase;
  AuthBloc(this.getRegisterUseCase,
      this.getLoginUseCase, this.getAddMovieToWishListUseCase,
      this.getGetMoviesToWishListUseCase, this.getDeleteMovieToWishListUseCase) : super(AuthState()) {
    on<GetRegisterEvent>(_register  );
on<GetLoginEvent>(_login );
on<GetAddMovieEvent>(_getAddMovieToWishlist);
on<GetGetMoviesEvent>(_getAllMovies);
on<GetDeleteMovieEvent>(_getDeleteMovie);
  }

  FutureOr<void> _register(GetRegisterEvent event,
      Emitter<AuthState> emit,

      )async {
   final result=await getRegisterUseCase.register
     (name: event.user!.name!, email: event.user.email,
       password: event.user.password) ;
   result.fold((l) {
     emit(state.copyWith(
       registerRequestState: RequestState.error,
       registerErrorMessage: l.errorMessage
     ));
   }, (r)  {
     emit(state.copyWith(
       user: r!,
       registerRequestState: RequestState.loaded
     ));
   },);
  }

  FutureOr<void> _login(GetLoginEvent event,
      Emitter<AuthState> emit)async* {
    final result=await getLoginUseCase.login(event.user.email,
        event.user.password)
     ;
    result.fold((l) {
      emit(state.copyWith(
          loginRequestState: RequestState.error,
          loginErrorMessage: l.errorMessage
      ));
    }, (r)  {
      emit(state.copyWith(
          user: r!,
          loginRequestState: RequestState.loaded
      ));
    },);
  }

  FutureOr<void> _getAddMovieToWishlist(GetAddMovieEvent event,
      Emitter<AuthState> emit) async {
    try {
      if (event.userId == null || event.userId == null) {
        emit(state.copyWith(
          wishlistErrorMessage: "Please log in to add movies to your wishlist.",
          wishlistRequestState: RequestState.error,
        ));
        return;
      }
      final result = await getAddMovieToWishListUseCase.addMovieToWishList(
        event.movie,
        event.userId!,
      );
      result.fold(
            (l) => emit(state.copyWith(
          wishlistErrorMessage: l.errorMessage,
          wishlistRequestState: RequestState.error,
        )),
            (r) => emit(state.copyWith(
          wishlistRequestState: RequestState.loaded,
          movie: r,
        )),
      );
    } catch (error) {
      emit(state.copyWith(
        wishlistErrorMessage: "Error adding movie to wishlist: $error",
        wishlistRequestState: RequestState.error,
      ));
    }
  }

  Future<FutureOr<void>> _getAllMovies(GetGetMoviesEvent event,
      Emitter<AuthState> emit) async {
  final result=await getGetMoviesToWishListUseCase.
  getMovieToWishList(event.userId);
  result.fold((l) {
    emit(state.copyWith(
      wishlistErrorMessage: l.errorMessage,
      wishlistRequestState: RequestState.error
    ));
  }, (r) {
    emit(state.copyWith(
   movies: r,
        wishlistRequestState: RequestState.loaded
    ));
  });
  }

  FutureOr<void> _getDeleteMovie(GetDeleteMovieEvent event,
      Emitter<AuthState> emit) async{
    final result=await getDeleteMovieToWishListUseCase.deleteMovieFromWishList
      (event.userId, event.movie);
    result.fold((l) {
      emit(state.copyWith(
        deleteMovieErrorMessage: l.errorMessage,
        deleteMovieRequestState: RequestState.error
      ));
    }, (r) {
      emit(state.copyWith(

          deleteMovieRequestState: RequestState.loaded
      ));
    });
  }
}
