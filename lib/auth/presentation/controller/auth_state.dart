import 'package:equatable/equatable.dart';



import '../../../core/utils/enum.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../domain/entities/user.dart';

class AuthState extends Equatable {
  final RequestState loginRequestState;
  final RequestState registerRequestState;
  final String loginErrorMessage;
  final String registerErrorMessage;
  final User? user;
  final RequestState wishlistRequestState;
  final String wishlistErrorMessage;
  final RequestState deleteMovieRequestState;
  final String deleteMovieErrorMessage;
  final List<Movie>movies;
  final Movie? movie;

  AuthState({this.wishlistRequestState = RequestState.loading,
    this.wishlistErrorMessage = "",
    this.deleteMovieErrorMessage="",
    this.deleteMovieRequestState=RequestState.loading,
    this.movies = const [], this.movie, this.loginRequestState =
        RequestState
        .loading,
    this.registerRequestState = RequestState.loading,
    this.loginErrorMessage = "", this.registerErrorMessage = "",
    this.user,

  });

  AuthState copyWith({
    RequestState? loginRequestState,
    RequestState? registerRequestState,
    String? loginErrorMessage,
    String? registerErrorMessage,
    User? user,
    RequestState? wishlistRequestState,
    String? wishlistErrorMessage,
    List<Movie>?movies,
    Movie? movie,
     RequestState? deleteMovieRequestState,
     String? deleteMovieErrorMessage
  }) {
    return AuthState(
        user: user ?? this.user,
        deleteMovieErrorMessage:deleteMovieErrorMessage??this.deleteMovieErrorMessage,
        deleteMovieRequestState:deleteMovieRequestState??this.deleteMovieRequestState ,
        loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
        registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
        loginRequestState: loginRequestState ?? this.loginRequestState,
        registerRequestState: registerRequestState ??
            this.registerRequestState,
        wishlistRequestState: wishlistRequestState ?? this.wishlistRequestState,
        wishlistErrorMessage: wishlistErrorMessage ?? this.wishlistErrorMessage,
        movies: movies ?? this.movies,
        movie: movie ?? this.movie
    );
  }

  @override
  List<Object?> get props =>
      [
        loginRequestState,
        registerRequestState,
        loginErrorMessage,
        registerErrorMessage,
        user,
        wishlistRequestState,
        wishlistErrorMessage,
        movies,
        movie,

      ];
}


