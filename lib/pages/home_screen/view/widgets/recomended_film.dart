import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/pages/home_screen/api/api_constant.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_bloc.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_state.dart';

import '../../../../shared/theme/theme.dart';



class recommendedComponents extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return       BlocBuilder<MoviesBloc,MoviesStates>(
      builder: (context,state){
        
        return   Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.3,
          decoration: BoxDecoration(
              color:AppTheme.containerColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 5.h,),
              Text("   Recomended ",
                style:Theme.of(context).textTheme.titleLarge ,),
              SizedBox(height: 5.h,),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      final movie=state.topRatedMovies[index];
                      return  Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: GestureDetector(
                          onTap: (){},
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
                                    imageUrl: ApiConstant.imageurl(movie.backdropPath),
                                      fit: BoxFit.cover,

                                      height:  MediaQuery.of(context).size.height * 0.15,
                                    ),
                                    Image.asset("assets/bookmark.png"),
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
                                     movie.voteAverage.toString(),
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
                                  movie.title,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      color: AppTheme.white, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                movie.releaseData.substring(0,4),
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
                }, itemCount: state.topRatedMovies.length),
              ),
            ],
          ),
        );
      },
    
    
    );
  }
}
class recomendedMovieItem extends StatelessWidget {
  const recomendedMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          // height: MediaQuery.of(context).size.height*.3,
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
                  Image.asset(
                    'assets/recomendedfilm.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Image.asset("assets/bookmark.png"),
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
                    "7.7",
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
                " Deadpool 2",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppTheme.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                " 2018  R  1h 59m",
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
  }
}

