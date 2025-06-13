import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/utils/errors/failure.dart';

import '../../../core/utils/use_case/base_use_case.dart';
import '../../../movies/domain/repositry/base_movie_repositry.dart';
import '../entities/Recommendation.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepositry baseMoviesRepositry;

  GetRecommendationUseCase({required this.baseMoviesRepositry});

  @override
  Future<Either<Failure, List<Recommendation>>>
  call(RecommendationParameters parameters) async {
    return await baseMoviesRepositry.getRecommendation(parameters);
  }

}

class RecommendationParameters extends Equatable {
  final int id;

  RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];

}