import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/pages/genere/data/genere.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/movie_Detials/view_model/base_view_model.dart';
import 'package:movie_app/shared/error/failure.dart';

class GetGenereViewModel extends BaseViewModel<List<Genere>,GenerParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetGenereViewModel(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Genere>>> call(GenerParameters parameters)async {
   return await baseMovieRepository.getGenereMovies(parameters);

  }
}
class GenerParameters extends Equatable{
  final int id;
  final String name;

  GenerParameters(this.id, this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}