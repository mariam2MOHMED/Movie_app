part of 'genere_bloc.dart';

 class GenereState extends Equatable {
  final List<Genere>genere;
  final String genereMessage;
  final RequestState genereState;
  const GenereState({this.genere=const [],
    this.genereMessage="",
    this.genereState=RequestState.loading});
  GenereState copyWith({
    List<Genere>?genere,
    String? genereMessage,
     RequestState? genereState,
}
){
    return GenereState(
      genere: genere??this.genere,
      genereMessage: genereMessage??this.genereMessage,
      genereState: genereState??this.genereState
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    genere,
    genereState,
    genereMessage
  ];

}


