import 'package:equatable/equatable.dart';

class GenereList extends Equatable {
  final int id;
  final String name;

  GenereList(
      {required this.id,
        required this.name});

  @override
  List<Object> get props => [id, name];
}