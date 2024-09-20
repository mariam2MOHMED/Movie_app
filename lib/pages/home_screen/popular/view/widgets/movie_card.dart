import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../movie_details_screen.dart';
import '../../../../../shared/theme/theme.dart';
import '../../models/video.dart';



class movieCard extends StatelessWidget {

   movieCard({

     super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
