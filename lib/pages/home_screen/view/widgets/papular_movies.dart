import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_state.dart';
import 'package:movie_app/shared/request.dart';
import 'package:shimmer/shimmer.dart';

import '../../../movie_Detials/view/screens/movie_details_screen.dart';
import '../../../../../shared/theme/theme.dart';
import '../../api/api_constant.dart';
import '../../cubit/movies_bloc.dart';
import '../../data/data_sources/movies_list.dart';





class popularMovies extends StatelessWidget {
  const popularMovies({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<MoviesBloc,MoviesStates>(
      builder: (BuildContext context,  state) {
        switch(state.papularMoviesStates){
          case RequestState.loading:
            return SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
              child: Center(
                child: CircularProgressIndicator(
                      color: AppTheme.white,

                ),
              ),
            );

            case RequestState.loaded:
              return      FadeIn(
                duration: Duration(seconds: 1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.3,
                  child: CarouselSlider(items:
                  state.papularMovies.map((papularItem)
                  =>     GestureDetector(
                    onTap: (){

                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              id: state.papularMovies[state.papularMovies.indexOf(papularItem)].id,
                            ),
                          ));
                      },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.2,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: ApiConstant.imageurl(papularItem.backdropPath),
                                errorWidget:(context,url,error)=>
                                    Icon(Icons.image_not_supported,size:40.sp ,),
                                placeholder: (context,url)=>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.1,
                                    width: MediaQuery.of(context).size.width*0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),

                              ),
                            ),
                            IconButton(onPressed: (){
                              Navigator.of(context).pushNamed(MovieDetailsScreen.routeName);
                            }, icon: Icon(
                              Icons.play_circle,color: AppTheme.white,
                              size: 50.sp,
                            ))
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(papularItem.title,
                            style:Theme.of(context).textTheme.titleLarge ,),
                        ),

                        SizedBox(height: 5.h,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(papularItem.releaseData,
                            style:Theme.of(context).
                            textTheme.headlineSmall ,),
                        ),

                      ],
                    ),
                  )).toList(),
                      options: CarouselOptions(

                        height: MediaQuery.of(context).size.height*0.3,

                        viewportFraction:1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 2),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index,reason){

                        },
                      )),
                ),
              );

          case RequestState.error:
            return Center(child: Text(state.papularMessage));
        }

      },);



  }
}
