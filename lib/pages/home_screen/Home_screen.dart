import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/movie_details_screen.dart';
import 'package:movie_app/pages/home_screen/api/api_services.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_bloc.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_events.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_state.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/home_screen/view/widgets/papular_movies.dart';




import 'package:movie_app/pages/home_screen/view/widgets/new_release_movies.dart';
import 'package:movie_app/pages/home_screen/view_model/papular_view_model.dart';

import '../../shared/services/services_locator.dart';
import '../../shared/theme/theme.dart';
import 'view/widgets/recomended_film.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print(sl<MoviesBloc>().hashCode);
    //ApiServices.getPapular();
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesBloc(sl())..add(GetPapulorMovieEvent(),


        )..add(GetNewReleaseMovieEvent())..add(GetRecommendedMovieEvent());
      },
      lazy: false,
      child:
      BlocBuilder<MoviesBloc,MoviesStates>(
        builder: (context,state){

          return     SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                popularMovies(),
                // SizedBox(height: 10.h,),
                newReleaseComponent(),
                SizedBox(height: 20.h,),

                recommendedComponents()
              ],
            ),
          );
        },


      ),
    );
  }
}
