import 'package:equatable/equatable.dart';

class Browse extends Equatable{
 final int id;
  final String title;
  Browse({
    required this.id,
 required   this.title,
   });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title
  ];


}