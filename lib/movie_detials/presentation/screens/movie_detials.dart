import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/core/utils/app_theme.dart';

import '../../../core/utils/enum.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/utils/widgets/error_widget.dart';
import '../../../core/utils/widgets/loading_widget.dart';
import '../../domain/use_case/get_movie_detials_use_case.dart';
import '../../domain/use_case/get_recommendation_use_case.dart';
import '../controller/movie_detials_bloc/movie_detials_bloc.dart';
import '../controller/movie_detials_bloc/movie_detials_state.dart';
import '../controller/movie_detials_bloc/movies_detials_exent.dart';
import '../widgets/movie_detials_widget.dart';
import '../widgets/similiar_list_view.dart';

class MovieDetialsScreen extends StatelessWidget {
   int movieId;
  MovieDetialsScreen({ required this.movieId});
  static String routeName="/MovieDetialsScreen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => MovieDetialsBloc(
      getit.get<GetMovieDetialsUseCase>(),
      getit.get<GetRecommendationUseCase>())..
  add(GetMovieDetialsEvent(id: movieId))..add
    (GetSimiliarMoviesEvent(id: movieId)),
  child: BlocBuilder<MovieDetialsBloc, MovieDetialsState>(
  builder: (context, state) {
    switch(state.movieDetialsState){
      case RequestState.loading:
        return LoadingWidget();
      case RequestState.loaded:
        return Scaffold(
            backgroundColor: AppTheme.bg,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: AppTheme.white
              ),
              backgroundColor: AppTheme.bg,
              title: Text(state.movieDetials!.title),
              titleTextStyle: TextStyle(
                  color: AppTheme.white,fontSize: 20.sp
              ),
            ),
            body:
            Column(
              children: [
                MovieDetialsWidget(
                  movieDetials: state.movieDetials!,
                ),
                SizedBox(height: 20.h,),
                Container(

                  height: MediaQuery.of(context).size.height*0.32,
                  color: AppTheme.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      Text("   More Like This",style: Theme.of(context).
                      textTheme.headlineLarge,),
                      SizedBox(height: 15.h,),
                      SimiliarListView(),
                      SizedBox(height: 15.h,),
                    ],
                  ),
                ),
              ],
            )

        );
      case RequestState.error:
        return ErrorToLoadDataWidget();
    }

  },
),
);
  }
}
