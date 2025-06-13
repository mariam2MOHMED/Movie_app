import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/core/utils/app_constants.dart';
import 'package:moviesapp/search/domain/entities/movie_search.dart';

import '../../../core/utils/app_theme.dart';

class SearchMovie extends StatelessWidget {
  MovieSearch movie;
   SearchMovie({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
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
            cacheKey: movie.id.toString(), // كاش ثابت يتجاهل التغيير البسيط في URL
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
                Text(movie.releaseDate.length >= 4
                    ? movie.releaseDate.substring(0, 4)
                    : "2019",style:
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
    );
  }
}



