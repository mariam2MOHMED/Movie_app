import 'package:equatable/equatable.dart';

abstract class SearchMovieEvent extends Equatable {

}

class GetSearchMovieEvent extends SearchMovieEvent {
  final String query;

  GetSearchMovieEvent({required this.query});
  @override
  List<Object> get props => [query];
}