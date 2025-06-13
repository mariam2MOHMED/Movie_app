import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class BaseUseCase<T,Parameters>{
  Future<Either<Failure,T>>call(Parameters parameters);
}
class NoParameters extends Equatable{
  NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}