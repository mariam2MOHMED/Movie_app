import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/core/utils/app_constants.dart';

import '../../../core/utils/app_theme.dart';
import '../../domain/entities/movie_detials.dart';
import 'movie_type_widget.dart';

class MovieDetialsWidget extends StatelessWidget {
   MovieDetialsWidget({required this.movieDetials});
   MovieDetials movieDetials;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //height : MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(

                    child: Image.network(AppConstants.getPathImage
                      (movieDetials.image!),
                      width: MediaQuery.of(context).size.width,
                      height: 150.h, // Adjust based on your design
                      fit: BoxFit.cover,
                    ),
                  )
                  , IconButton(onPressed: (){},
                      icon: Icon(
                        color: Colors.white,
                        Icons.
                        play_circle_fill,size: 60,))
                ],
              ),
              SizedBox(height: 10.sp,),
              Padding(
                padding:  EdgeInsets.only(left: 16.0),
                child: Text(movieDetials.title??"Unknown Title",style: Theme.of(context).textTheme.headlineMedium,),
              )
              , SizedBox(height: 10.sp,),
              Padding(
                padding:  EdgeInsets.only(left: 16.0),
                child: Text("${movieDetials.releaseDate} ${movieDetials.runTime}",
                  style: Theme.of(context).
                  textTheme.headlineSmall,),
              )

            ],
          ),
        ),
        SizedBox(height: 20.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Stack(
                // clipBehavior: Clip.hardEdge,
                alignment: Alignment.topLeft,
                children: [
                  Image.network(AppConstants.getPathImage(
                      movieDetials.posterImage!)
                    ,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.25,),
                  Image.asset("assets/images/bookmark.png",
                    height: 40.h,
                    fit: BoxFit.cover,),

                ],

              ),
              SizedBox(width: 16.w,),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          Row(
            children: [
              MovieType(title: movieDetials.geners[0].name??"Comedy"),
              SizedBox(width: 15.w,),
              MovieType(title: movieDetials?.geners?[1].name??"Action"),

            ],
          ),
                    SizedBox(height: 10.h,),
                    Text(movieDetials.overView,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style:Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Color(0xffCBCBCB)
                      ) ,),
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        Icon(Icons.star,size: 24.sp,color: AppTheme.primaryColor,),
                        SizedBox(width: 10.w,),
                        Text(movieDetials.voteAverage.toString().substring(0,3)??"7.9",style: Theme.of(context).
                        textTheme.headlineLarge?.copyWith(
                            color: AppTheme.white
                        ),),
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}
