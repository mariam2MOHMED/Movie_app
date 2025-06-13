import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/core/utils/widgets/error_widget.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';
import 'package:moviesapp/movies/presentation/controller/movies_bloc.dart';
import 'package:moviesapp/movies/presentation/widgets/recommended_movie.dart';
import 'package:redacted/redacted.dart';

import '../../../movie_detials/presentation/screens/movie_detials.dart';
import '../controller/movies_states.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<MovieBloc, MoviesState>(
      buildWhen: (previous,  current)=>
      previous.topRatedRequestState!=current.topRatedRequestState,
      builder: (context, state) {
      switch(state.topRatedRequestState ){
        case RequestState.loaded:
        return
 Expanded(child: ListView.separated
            (padding: EdgeInsets.only(left: 16.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>MovieDetialsScreen(
                          movieId: state.topRatedMovies[index].
                          id,
                        )));
                  },
                  child: RecommendedMovie(
                    movie: state.topRatedMovies[index],
state1: RequestState.loaded,
                  ),
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(width: 20.w,);
              },
              itemCount: state.topRatedMovies.length),
        );
        case RequestState.loading:
          return Expanded(

            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RecommendedMovie(
                  state1: RequestState.loading,
                  movie: Movie(
                    id: 0,
                    title: "Placeholder",

                    voteAverage: 0.0,
                    releaseDate: "", originalTitle: '',
                    image: '', genreIds: [],
                  ),
                ).redacted(context: context, redact: true);
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: 20.w),
              itemCount: 4,
            ),
          );
        case RequestState.error:
          return ErrorToLoadDataWidget();
      }
      },
    );
  }
}
