import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/core/utils/app_theme.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';

import 'package:shimmer/shimmer.dart';

import '../../../auth/presentation/controller/auth_bloc.dart';
import '../../../auth/presentation/controller/auth_event.dart';
import '../../../auth/presentation/controller/auth_state.dart';
import '../../../core/utils/app_constants.dart';

class NewReleaseWidget extends StatelessWidget {
   Movie movie;
   NewReleaseWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final imagePath = (movie!.image != null && movie!.image!.isNotEmpty)
        ? movie!.image!
        : "/7Zx3wDG5bBtcfk8lcnCWDOLM4Y4.jpg";
    return
      Stack(
        alignment: Alignment.topLeft,
      children: [
        CachedNetworkImage(imageUrl:
        AppConstants.getPathImage(movie.image ),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width*0.3,
          height: MediaQuery.of(context).size.height*0.2,

          errorWidget: (context,url,error)=>
            Icon(Icons.image_not_supported_rounded,
         color: AppTheme.lightGray,size: 50.sp,
        ),
        ),
        BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
   return  InkWell(
      onTap: () {
        //if (state.user != null) {
          BlocProvider.of<AuthBloc>(context).add(
            GetAddMovieEvent(
                movie: movie,userId:
       FirebaseAuth.instance.currentUser!.uid!
            ),
          );
        ////}
      },
  child: Image.asset("assets/images/bookmark.png",
            height: 40.h,
            fit: BoxFit.fill,),
        );
  },
)
      ],


      )

      ;
  }
}
