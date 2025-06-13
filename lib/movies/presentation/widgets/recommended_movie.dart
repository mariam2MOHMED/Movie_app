import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/auth/presentation/controller/auth_event.dart';
import 'package:moviesapp/core/utils/app_constants.dart';
import 'package:moviesapp/core/utils/app_theme.dart';

import 'package:moviesapp/core/utils/enum.dart';


import '../../../auth/presentation/controller/auth_bloc.dart';
import '../../domain/entities/movie.dart';

class RecommendedMovie extends StatelessWidget {
  Movie movie;RequestState state1;
   RecommendedMovie({required this.movie,required this.state1});

  @override
  Widget build(BuildContext context) {
    return
      Container(
width: MediaQuery.of(context).size.width*0.3,
      decoration: BoxDecoration(
        color:Color(0xff343534),
        boxShadow: [
          BoxShadow(
        blurRadius: 3,spreadRadius: 1
          )
        ]
      ),
      child: Column(
        children: [
          Stack(
            // clipBehavior: Clip.hardEdge,
            alignment: Alignment.topLeft,
            children: [
              Image.network(AppConstants.getPathImage(movie.image??"/7Zx3wDG5bBtcfk8lcnCWDOLM4Y4.jpg"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: 127.h,),
              InkWell(
                onTap: () {

                  BlocProvider.of<AuthBloc>(context).add(
                    GetAddMovieEvent(
                        movie: movie,userId:
                    FirebaseAuth.instance.currentUser!.uid!
                    ),
                  );

                },
                child: Image.asset("assets/images/bookmark.png",
                  height: 40.h,
                  fit: BoxFit.fill,),
              ),

            ],

          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
              Icon(Icons.star,size: 15.sp,color: AppTheme.primaryColor,),
                    SizedBox(width: 5.w,),
                    Text(movie.voteAverage.toString(),style: Theme.of(context).textTheme.
                    headlineSmall!.copyWith(
                      color: AppTheme.white
                    ),)
                  ],
                ),
                SizedBox(height: 7.h,),
                Text(movie.title,maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.
                headlineMedium,),
                SizedBox(height: 7.h,),
                Text("${state1==RequestState.loading?"2018":movie.releaseDate!.substring(0,4)}",
                  style: Theme.of(context).textTheme.
                headlineSmall,),
              ],
            ),
          )
        ],
      ),

      );
  }
}