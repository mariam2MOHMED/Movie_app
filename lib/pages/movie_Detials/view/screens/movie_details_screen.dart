import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/pages/home_screen/view/widgets/book_mark.dart';
import 'package:movie_app/pages/movie_Detials/cubit/movie_detials_bloc.dart';
import 'package:movie_app/pages/watch_list/view/widget/watch_item.dart';
import 'package:movie_app/shared/request.dart';

import 'package:movie_app/pages/movie_Detials/view/widget/default_elevated_button.dart';
import 'package:movie_app/pages/home_screen/view/widgets/recomended_film.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/services/services_locator.dart';
import '../../../../shared/theme/theme.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = "/movieDetails";
  final int id;
   MovieDetailsScreen({
    required this.id,
     super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => sl<MovieDetialsBloc>()..
  add(GetMovieDetialsEvent(id))..add(GetMovieMoreLikeEvent(id)),
  child: BlocBuilder<MovieDetialsBloc, MovieDetialsState>(
  builder: (context, state) {

    switch(state.requestState){
      case RequestState.loading:
        return Center(child: CircularProgressIndicator());
      case RequestState.loaded:
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.movieDetial!.title!,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20),
            ),
          ),
          body:     Column(
            children: [
              Container(
                color: AppTheme.gold,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    // width: MediaQuery.of(context).size.width,
                    //      'https://image.tmdb.org/t/p/w500${state.movieDetial!.posterPath}'
                    //                     height: MediaQuery.of(context).size.height*0.2,
                    CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
fit: BoxFit.cover,
                        imageUrl:
                        'https://image.tmdb.org/t/p/w500${state.movieDetial!.backDropPath!}')
                    , IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_circle,
                          color: AppTheme.white,
                          size: 50.sp,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  state.movieDetial!.title!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  " ${state.movieDetial!.releaseData.substring(0,4)}   ${ convertToHoursAndMinutes(state.movieDetial!.runTime).toString()}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .24,
                width: double.infinity,
                child:
                Row(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${state.movieDetial!.posterPath}',
                          height: MediaQuery.of(context).size.height*2,
                        ),

                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Row(
                            children: [
                              DefaultElevatedButton(
                                txt: state.movieDetial!.genre_ids[0].name??"action",
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              DefaultElevatedButton(
                                txt: state.movieDetial!.genre_ids[1].name??"drama",
                              ),

                              // DefaultElevatedButton(),
                            ],
                          ),

                          SizedBox(height: 8.h,),

                          Text(
                            '''${state.movieDetial!.overView.substring(0,30)}\n${state.movieDetial!.overView.substring(30,60)}\n${state.movieDetial!.overView.substring(60,90)} \n${state.movieDetial!.overView.substring(90,120)}''',
                            maxLines: 4,

                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(height: 8.h,),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon:  Icon(
                                    Icons.star_rounded,
                                    size: 20.0,
                                    color: AppTheme.gold,
                                  )),
                              Text(
                                state.movieDetial!.voteAverage.toString().substring(0,3),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                   BoxDecoration(color: AppTheme.containerColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 8.0),
                        child: Text(
                            "More Like This",
                            style:
                            Theme.of(context).textTheme.titleLarge
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Expanded(

                        child:
                        recomendedMovieItem(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      case RequestState.error:
        return Center(child: Text(state.message));
    }
  },
),
);
  }
  int hoursFromMinutes(int totalMinutes) {
    return totalMinutes ~/ 60; // Integer division to get hours
  }

  int minutesFromHours(int totalMinutes) {
    return totalMinutes % 60; // Remainder after dividing by 60 to get minutes
  }

  String convertToHoursAndMinutes(int totalMinutes) {
    int hours = hoursFromMinutes(totalMinutes);
    int minutes = minutesFromHours(totalMinutes);
    return "$hours h $minutes m";
  }
}

class recomendedMovieItem extends StatelessWidget {
   recomendedMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<MovieDetialsBloc, MovieDetialsState>(
  builder: (context, state) {

 return
   ListView.separated(
       scrollDirection: Axis.horizontal,
       itemBuilder: (context,index){
         final movie=state.moreLikemovies[index];
         return  Padding(
           padding: const EdgeInsets.only(
             left: 10.0,
           ),
           child: GestureDetector(
             onTap: (){
               Navigator.of(context).push(
                   MaterialPageRoute(
                     builder: (context) => MovieDetailsScreen(
                       id: movie.id,
                     ),
                   ));
             },
             child: Container(
               width: MediaQuery.of(context).size.width*.25,
               height: MediaQuery.of(context).size.height*.3,
               decoration: const BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                 color: AppTheme.recomendedFilm,
               ),

               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Stack(
                     alignment: AlignmentDirectional.topStart,
                     children: [
                       CachedNetworkImage(
                         imageUrl: "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                         fit: BoxFit.cover,

                         height:  MediaQuery.of(context).size.height * 0.15,
                       ),


                       // Container(
                       //   width: MediaQuery.of(context).size.width*.25,
                       //   height: 110.h,
                       //   // decoration: const BoxDecoration(
                       //   //     image: DecorationImage(image:

                       //   //     // AssetImage("assets/recomendedfilm.png"))
                       //   // ),
                       // ),

                       // const PositionedDirectional(

                       //   child: ImageIcon(
                       // AssetImage("assets/bookmark.png"),
                       // color: AppTheme.iconBar,size: 25,),
                       // )
                       // ),
                       // Icon(Icons.bookmark_outline_outlined,size: 27,
                       // color: AppTheme.bookMarkColor,),
                       // IconButton(onPressed: (){}, icon: Icon(Icons.add,color: AppTheme.gold,))
                     ],
                   ),
                   SizedBox(
                     height: 4.h,
                   ),
                   Row(
                     children: [
                       const Icon(
                         Icons.star,
                         color: AppTheme.gold,
                         size: 16,
                       ),
                       SizedBox(
                         width: 3.w,
                       ),
                       Text(
                         movie.voteAverage!.toString().substring(0,3)??"2016",
                         style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                             color: AppTheme.white, fontWeight: FontWeight.w600),
                       ),

                       //
                     ],
                   ),
                   SizedBox(
                     height: 4.h,
                   ),
                   Text(
                     movie!.title!,
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                         color: AppTheme.white, fontWeight: FontWeight.bold),
                   ),
                   SizedBox(
                     height: 4.h,
                   ),
                   Text(
                     movie!.releaseData!.substring(0,4)!,
                     style: Theme.of(context)
                         .textTheme
                         .headlineSmall
                         ?.copyWith(color: AppTheme.grey, fontWeight: FontWeight.w600),
                   ),
                 ],
               ),
             ),
           ),
         );
       }, separatorBuilder: (context,index){
     return SizedBox(width: 5.w,);
   }, itemCount: state.moreLikemovies.length);
  },
);
  }
}