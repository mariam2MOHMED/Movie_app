part of 'browse_bloc.dart';

 class BrowseState extends Equatable {
   final List<Browse> browse;
   final String browseMessage;
   final RequestState browseState;
  const BrowseState({
    this.browse=const [],
     this.browseMessage='',
       this.browseState=RequestState.loading});
   BrowseState copyWith({
     List<Browse>? browse,
      String? browseMessage,
      RequestState? browseState,
 }){
     return BrowseState(
       browse: browse??this.browse,
       browseMessage: browseMessage??this.browseMessage,
       browseState: browseState??this.browseState
     );
   }
  @override
  // TODO: implement props
  List<Object?> get props => [browse,
    browseState,
    browseMessage];
}


