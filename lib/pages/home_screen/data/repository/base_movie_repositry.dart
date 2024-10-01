
import 'package:dartz/dartz.dart';
import 'package:movie_app/pages/Search_page/data/models/search_class.dart';
import 'package:movie_app/pages/home_screen/view_model/get_more_like_view_model.dart';
import 'package:movie_app/pages/movie_Detials/data/models/more_like.dart';
import 'package:movie_app/pages/movie_Detials/data/models/movie_Detials_model.dart';
import 'package:movie_app/pages/movie_Detials/view_model/movie_detials_view_model.dart';

import '../../../../shared/error/failure.dart';
import '../../../Search_page/view_model/get_search.dart';
import '../../../movie_Detials/data/models/movie_detials.dart';
import '../models/movie.dart';

abstract class BaseMovieRepository{
  Future<Either<Failure,List<Movie>>>  getPapularMovie();
  Future<Either<Failure,List<Movie>>>  getNewRealeasesMovie();
  Future<Either<Failure,List<Movie>>>  getRecommendedMovie();
  Future<Either<Failure,List<MoreLike>>>  getMoreLikeMovies(
      MoreLikeParameters moreLikeParameters
      );
  Future<Either<Failure,List<Search>>>  geSearchMovies(
      SearchParameters searchParameters
      );
  Future<Either<Failure,MovieDetial>>
  getMovieDetials(MovieDetialsParameter movieDetialsParameter);
  // NewRealeases
}