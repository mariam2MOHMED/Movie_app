import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_theme.dart';
import '../../domain/entities/Recommendation.dart';

class SimilarMovie extends StatelessWidget {
final Recommendation recommendation;
   SimilarMovie({required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return    Container(
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
              Image.network(AppConstants.getPathImage
                (recommendation.image??"/4UDkTfo3HTBpYfRgswvKJswyAwJ.jpg"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: 127.h,),
              Image.asset("assets/images/bookmark.png",
                height: 40.h,
                fit: BoxFit.fill,),
      ],),
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
                    Text(recommendation.voteAverage.toString().substring(0,3),style: Theme.of(context).textTheme.
                    headlineSmall!.copyWith(
                        color: AppTheme.white
                    ),)
                  ],
                ),
                SizedBox(height: 7.h,),
                Text("${recommendation.title??"Rocco & Sjuul"}",maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.
                  headlineMedium,),
                SizedBox(height: 7.h,),
                Text("${recommendation.releaseDate != null &&
                    recommendation.releaseDate!.length >= 4
                    ? recommendation.releaseDate!.substring(0, 4)
            : '2020'}",
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
