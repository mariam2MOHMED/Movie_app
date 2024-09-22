import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../movie_details_screen.dart';
import '../../../../../shared/theme/theme.dart';




class movieCard extends StatelessWidget {

   movieCard({

     super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(image:
                  AssetImage('assets/Image_movie.png'))
              ),
            ),
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(MovieDetailsScreen.routeName);
            }, icon: Icon(
              Icons.play_circle,color: AppTheme.white,
              size: 50.sp,
            ))
          ],
        ),
        // Stack(
        //   alignment: AlignmentDirectional.topStart,
        //   children: [
        //
        //     Image.asset(
        //       'assets/film_poster.png',
        //       fit: BoxFit.cover,
        //       width: MediaQuery.of(context).size.width * 0.25,
        //       height: MediaQuery.of(context).size.height * 0.2,
        //     ),
        //     Image.asset("assets/bookmark.png"),
        //
        //
        //   ],
        // ),
      ],
    );



  }
}
