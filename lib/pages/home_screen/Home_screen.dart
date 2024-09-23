import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/movie_details_screen.dart';
import 'package:movie_app/pages/home_screen/api/api_services.dart';




import 'package:movie_app/pages/home_screen/view/widgets/new_release_movie_item.dart';

import '../../shared/theme/theme.dart';
import 'view/widgets/recomended_film.dart';
import 'view/widgets/movie_carousel.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ApiServices.getPapular();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          movieCarouselSlider(),
          Text(" Dora and the lost city of gold",
            style:Theme.of(context).textTheme.titleLarge ,),
          SizedBox(height: 7.h,),
          Text(" 2019  PG-13  2h 7m",
            style:Theme.of(context).
            textTheme.headlineSmall ,),
          SizedBox(height: 20.h,),
          SizedBox(height: 10.h,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.28,
            decoration: BoxDecoration(
              color:AppTheme.containerColor
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                Text(" New Releases ",
                  style:Theme.of(context).textTheme.titleLarge ,),
                SizedBox(height: 10.h,),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return newReleaseMovieItem();
                      }, separatorBuilder: (context,index){
                        return SizedBox(width: 5.w,);
                  }, itemCount: 10),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
      
          Container(
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
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return recomendedMovieItem();
                      }, separatorBuilder: (context,index){
                    return SizedBox(width: 5.w,);
                  }, itemCount: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
