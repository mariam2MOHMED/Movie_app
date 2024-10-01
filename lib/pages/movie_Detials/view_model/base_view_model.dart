import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/shared/error/failure.dart';

abstract class BaseViewModel<T,Parameters>{
  Future<Either<Failure,T>>call(Parameters parameters);
}
class NoParameters extends Equatable{
  NoParameters();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}