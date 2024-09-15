import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/theme/app_theme.dart';

class recomendedMovieItem extends StatelessWidget {
  const recomendedMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(

        color: AppTheme.recomendedFilm,
        child:
        Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                // Image.asset('assets/recomendedfilm.png',
                // width: MediaQuery.of(context).size.width*0.28,)
                Container(
                  width: MediaQuery.of(context).size.width*.25,
                  height: 110.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(image:

                      AssetImage("assets/recomendedfilm.png"))
                  ),
                ),

                PositionedDirectional(

                  child: ImageIcon(
                    AssetImage("assets/bookmark.png"),
                    color: AppTheme.iconBar,size: 25,),
                ),
                // Icon(Icons.bookmark_add_rounded,size: 27,
                // color: AppTheme.bookMarkColor,)
              ],
            ),
            SizedBox(height: 4.h,),
            Row(
              children: [
                Icon(Icons.star,color: AppTheme.gold,size: 16,),
                SizedBox(width: 3.w,),
                Text("7.7",style:
                Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppTheme.white,
                  fontWeight: FontWeight.w600
                ),),

                //
              ],
            ),
            SizedBox(height: 4.h,),
            Text(" Deadpool 2",style:
            Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.white,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 4.h,),
            Text(" 2018  R  1h 59m",style:
            Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.grey,
                fontWeight: FontWeight.w600
            ),),
          ],
        ),
      ),
    );
  }
}