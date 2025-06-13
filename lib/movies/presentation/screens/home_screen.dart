import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/core/utils/app_theme.dart';
import 'package:moviesapp/movies/domain/use_cases/get_new_release_movies_use_case.dart';
import 'package:moviesapp/movies/presentation/controller/movies_bloc.dart';
import 'package:moviesapp/movies/presentation/widgets/carousal_slider.dart';
import 'package:moviesapp/movies/presentation/widgets/new_release_movies.dart';

import '../../../core/utils/service_locator.dart';
import '../../domain/use_cases/get_papular_movies_use_case.dart';
import '../../domain/use_cases/get_top_rated_movies_use_case.dart';
import '../controller/movies_events.dart';
import '../widgets/recommended_movies_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(

  create: (BuildContext context) {
   final bloc=MovieBloc(getit.get<
       GetPopularMoviesUseCase>(),
       getit.get<GetNewReleaseMoviesUseCase>(),
       getit.get<GetTopRatedMoviesUseCase>())..

   add(GetPopularMoviesEvent())..
   add(GetNewReleaseMoviesEvent())
     ..add(GetTopRatedMoviesEvent());
   //  return MovieBloc(getit.get<GetPopularMoviesUseCase>(),
   //    getit.get<GetNewReleaseMoviesUseCase>(),
   //  )..add(GetPapularMoviesEvent())
   //    ..add(GetNewReleaseMoviesEvent());
    return bloc;

  },
      //lazy: false,

  child:
  Column(
    children: [
      SliderImages(),
      SizedBox(height: 20.h,),
      Container(

        height: MediaQuery.of(context).size.height*0.25,
        color: AppTheme.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Text("  New Release",style: Theme.of(context).
            textTheme.headlineLarge,),
            SizedBox(height: 15.h,),
           NewReleaseListView(),
//            BlocBuilder<MovieBloc, MoviesState>(
//   builder: (context, state) {
//     return Expanded(
//
//
//       child: ListView.separated
//
//       (
//       padding: EdgeInsets.only(left: 16.0),
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return NewReleaseWidget(
//             movie: state.newReleaseMovies[index],
//           );
//         },
//         separatorBuilder: (context, index) {
//           return SizedBox(width: 20.w,);
//         },
//         itemCount: state.newReleaseMovies.length),
//     );
//   },
// ),
            SizedBox(height: 15.h,),
          ],
        ),
      ),
      SizedBox(height: 20.h,),
      Container(

        height: MediaQuery.of(context).size.height*0.32,
        color: AppTheme.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Text("  Recommended",style: Theme.of(context).
            textTheme.headlineLarge,),
            SizedBox(height: 15.h,),
            RecommendedListView(),
            SizedBox(height: 15.h,),
          ],
        ),
      ),
    ],
  ),
);

  }
}


