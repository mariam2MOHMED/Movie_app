import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/core/utils/app_theme.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/core/utils/widgets/error_widget.dart';
import 'package:moviesapp/search/presentation/controllers/search_movie_bloc.dart';
import 'package:moviesapp/search/presentation/controllers/search_movie_states.dart';
import 'package:moviesapp/search/presentation/widgets/no_search_movies.dart';
import 'package:moviesapp/search/presentation/widgets/search_item.dart';

import '../../../movie_detials/presentation/screens/movie_detials.dart';


class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesBloc, SearchMovieState>(
      builder: (context, state) {
        if(state.searchMovies.length==0){
         return NoSearchMovies();
        }else{
         switch(state.searchMovieState){
           case RequestState.loading:
             return Center(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment:MainAxisAlignment.center ,
                 children: [
                   SizedBox( height: MediaQuery.of(context).size.height*0.25,),
                   LoadingAnimationWidget.threeArchedCircle(
                       color: AppTheme.gray,
                       size: 70.sp),],),);
           case RequestState.loaded:
             return Expanded(
               child: ListView.separated(itemBuilder: (context, index) {
                 return InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder:
                         (context)=>MovieDetialsScreen(movieId:
                         state.searchMovies[index].
                         id)));
                   },
                   child: SearchMovie(
                     movie:state.searchMovies[index],
                   ),
                 );
               },
                   separatorBuilder: (context, index) {
                     return Container(
                       width: MediaQuery
                           .of(context)
                           .size
                           .width,
                       height: 2.h,
                       color: Color(0xff707070),
                       margin: EdgeInsets.symmetric(
                           horizontal: 8,
                           vertical: 16
                       ),
                     );
                   },
                   itemCount: state.searchMovies.length),
             );
           case RequestState.error:
             return ErrorToLoadDataWidget();
         }
        }

      },
    );
  }
}
