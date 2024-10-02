part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}
class GetSearchEvent extends SearchEvent{
  final  String query;

  GetSearchEvent({required this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [query];

}