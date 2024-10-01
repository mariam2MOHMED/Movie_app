part of 'movie_detials_bloc.dart';


 class MovieDetialsState extends Equatable {
  final MovieDetial? movieDetial;
  final String message;
  final RequestState requestState;
  final List<MoreLike> moreLikemovies;
  final String moreLikeMessage;
  final RequestState moreLikeState;

  MovieDetialsState({
    this.movieDetial,
    this.message="",
    this.requestState=RequestState.loading,
  this.moreLikeMessage="",
    this.moreLikeState=RequestState.loading,
    this.moreLikemovies=const []
  });
  MovieDetialsState copyWith({
     MovieDetial? movieDetial,
     String? message,
     RequestState? requestState,
     List<MoreLike>? moreLikemovies,
     String? moreLikeMessage,
     RequestState? moreLikeState

  }){
    return MovieDetialsState(
      movieDetial: movieDetial??this.movieDetial,
      message: message??this.message,
      requestState: requestState??this.requestState,
      moreLikemovies: moreLikemovies??this.moreLikemovies,
      moreLikeMessage: moreLikeMessage??this.moreLikeMessage,
      moreLikeState: moreLikeState??this.moreLikeState
    );
}
  @override
  // TODO: implement props
  List<Object?> get props => [
   movieDetial,
   message,
   requestState,
    moreLikemovies,
    moreLikeMessage,
    moreLikeState
  ];

 }



