part of 'search_bloc.dart';

 class SearchState extends Equatable {
   final List<Search> search;
   final RequestState searchState;
   final String searchMessage;

  SearchState({ this.search=const [],
     this.searchState=RequestState.loading,
     this.searchMessage=''});
   SearchState copyWith({
      List<Search>? search,
     RequestState? searchState,
      String? searchMessage,
 }){
     return SearchState(
       search: search??this.search,
       searchMessage: searchMessage??this.searchMessage,
       searchState: searchState??this.searchState
     );
}
  @override
  // TODO: implement props
  List<Object?> get props => [
    search,
    searchState,
    searchMessage,
  ];

}


