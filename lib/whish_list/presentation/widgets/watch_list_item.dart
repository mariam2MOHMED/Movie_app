import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import '../../../auth/presentation/controller/auth_bloc.dart';
import '../../../auth/presentation/controller/auth_event.dart';
import '../../../auth/presentation/controller/auth_state.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_theme.dart';
import '../../../movies/domain/entities/movie.dart';

class WatchListMovie extends StatelessWidget {
final Movie movie;
  WatchListMovie({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(),
            children: [
         BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    return SlidableAction(onPressed: (context){
           context.read<AuthBloc>()..add(
               GetDeleteMovieEvent(movie: movie,
                   userId: FirebaseAuth.instance.currentUser!.uid))..
           add(GetGetMoviesEvent(userId:  FirebaseAuth.instance.currentUser!.uid));
         },
                backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
         
                );
  },
)
            ]),
        child: Row(
          children: [

            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                CachedNetworkImage(
                  imageUrl: AppConstants.getPathImage(movie.image),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,

                      ),
                    ),
                    //   child: Image.network(AppConstants.getPathImage(movie.image)),
                  ),
                         //   cacheKey: movie.id.toString(), // كاش ثابت يتجاهل التغيير البسيط في URL
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.1,
                  placeholder: (context, url) => Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: AppTheme.primaryColor,
                      size: 30,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.image_not_supported_rounded,
                    color: AppTheme.darkGrey,
                    size: 40.sp,
                  ),
                  fadeInCurve: Curves.easeInOut,
                  fadeInDuration: const Duration(milliseconds: 500),

                ),
                Image.asset("assets/images/addedbookmark.png",
                  height: 40.h,
                  fit: BoxFit.fill,
                )
              ],
            ),
            SizedBox(width: 20.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                    Theme.of(context).textTheme.headlineMedium ,),
                  SizedBox(height: 10.h,),
                  Text(
                    movie.releaseDate!.length >= 4
                      ? movie.releaseDate!.substring(0, 4)
                      :
                    "2019",style:
                  Theme.of(context).textTheme.headlineSmall ,),
                  SizedBox(height: 7.h,),
                  Text(movie.originalTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                    Theme.of(context).textTheme.headlineSmall ,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



