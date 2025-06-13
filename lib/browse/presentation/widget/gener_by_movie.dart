import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/browse/domain/entities/gener_by_movies.dart';
import 'package:moviesapp/core/utils/app_constants.dart';

import '../../../core/utils/app_theme.dart';

class GenerByMovie extends StatelessWidget {
final GenerByMovies generByMovies;
  GenerByMovie({required this.generByMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
// Image.network(AppConstants.getPathImage(generByMovies.image),
//   fit: BoxFit.cover,
//   width: MediaQuery.of(context).size.width * 0.3,
//   height: MediaQuery.of(context).size.height * 0.1,),
          CachedNetworkImage(
            imageUrl: AppConstants.getPathImage(generByMovies.image??"/7Zx3wDG5bBtcfk8lcnCWDOLM4Y4.jpg"),
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
                Text(generByMovies.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                  Theme.of(context).textTheme.headlineMedium ,),
                SizedBox(height: 10.h,),
                Text(
                  generByMovies.releaseDate.length >= 4
                    ? generByMovies.releaseDate.substring(0, 4)
                    :
                  "2019",style:
                Theme.of(context).textTheme.headlineSmall ,),
                SizedBox(height: 7.h,),
                Text(generByMovies.originalTitle,
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
