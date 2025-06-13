import 'package:dartz/dartz.dart';
import 'package:moviesapp/browse/domain/repositry/base_genere_repositry.dart';
import 'package:moviesapp/core/utils/errors/failure.dart';

import '../../../core/utils/use_case/base_use_case.dart';
import '../entities/genere_list.dart';

class GetGenerListUseCase extends BaseUseCase<List<GenereList>,NoParameters>{
  final BaseGenereRepositry baseGenereListRepositry;

  GetGenerListUseCase({required this.baseGenereListRepositry});

  @override
  Future<Either<Failure, List<GenereList>>> call(NoParameters parameters) async{
    // TODO: implement call
    return await baseGenereListRepositry.getGenerListMovies();
  }
}