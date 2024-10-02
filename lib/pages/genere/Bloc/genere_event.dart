part of 'genere_bloc.dart';
 abstract class GenereEvent extends Equatable {
  const GenereEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class GetGenereByMoviesEvent extends GenereEvent{
  final int id;
  final String name;

  GetGenereByMoviesEvent(this.id,this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}