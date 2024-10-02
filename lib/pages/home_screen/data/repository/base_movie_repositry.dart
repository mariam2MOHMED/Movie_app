
import 'package:dartz/dartz.dart';

import 'package:movie_app/pages/browse/data/models/Browse.dart';
import 'package:movie_app/pages/browse/view_model/get_browse_view_model.dart';
import 'package:movie_app/pages/genere/data/genere.dart';
import 'package:movie_app/pages/home_screen/view_model/get_more_like_view_model.dart';
import 'package:movie_app/pages/movie_Detials/data/models/more_like.dart';
import 'package:movie_app/pages/movie_Detials/data/models/movie_Detials_model.dart';
import 'package:movie_app/pages/movie_Detials/view_model/movie_detials_view_model.dart';

import '../../../../shared/error/failure.dart';

import '../../../genere/view_model/genere_view_model.dart';
import '../../../movie_Detials/data/models/movie_detials.dart';
import '../../../search/data/models/search_class.dart';
import '../../../search/view_model/get_search.dart';
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
  Future<Either<Failure,List<Browse>>>  getBrowseMovies(

      );
  Future<Either<Failure,List<Genere>>>  getGenereMovies(
      GenerParameters parameters
      );
  Future<Either<Failure,MovieDetial>>
  getMovieDetials(MovieDetialsParameter movieDetialsParameter);
  // NewRealeases
}