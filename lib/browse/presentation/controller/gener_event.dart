part of 'gener_bloc.dart';

abstract class GenerEvent extends Equatable {

}
class GetGenerListEvent extends GenerEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class GetMoviesByGenersEvent extends GenerEvent{
  final int generByMovieId;

  GetMoviesByGenersEvent({required this.generByMovieId});

  @override
  // TODO: implement props
  List<Object?> get props => [generByMovieId];
}
