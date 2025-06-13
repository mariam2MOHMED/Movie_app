part of 'gener_bloc.dart';

 class GenerState extends Equatable{
   final List<GenereList>genersList;
   final RequestState generListState;
   final String generListMessage;
   final List<GenerByMovies>moviesByGeners;
   final RequestState moviesByGenersState;
   final String moviesByGenersMessage;
  GenerState({ this.genersList=const [],
     this.generListState=RequestState.loading,
     this.generListMessage="",
  this.moviesByGeners=const [],
    this.moviesByGenersMessage="",
    this.moviesByGenersState=RequestState.loading
  });
   GenerState copyWith({
      List<GenereList>?genersList,
      RequestState? generListState,
      String? generListMessage,
      List<GenerByMovies>?moviesByGeners,
      RequestState? moviesByGenersState,
      String? moviesByGenersMessage,
 }){
     return GenerState(
       genersList: genersList??this.genersList,
       generListMessage: generListMessage??this.generListMessage,
       generListState: generListState??this.generListState,
       moviesByGeners: moviesByGeners??this.moviesByGeners,
       moviesByGenersMessage: moviesByGenersMessage??this.moviesByGenersMessage,
       moviesByGenersState: moviesByGenersState??this.moviesByGenersState
     );
}
  @override
  // TODO: implement props
  List<Object?> get props => [
    genersList,generListState,generListMessage,
    moviesByGeners,moviesByGenersMessage,moviesByGenersState
  ];
 }


