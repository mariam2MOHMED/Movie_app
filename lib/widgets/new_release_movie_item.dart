import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/theme/app_theme.dart';

class newReleaseMovieItem extends StatelessWidget {
  const newReleaseMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 5),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
      children: [
        Container(
      width: MediaQuery.of(context).size.width*.25,
      height: 128.h,
      decoration: const BoxDecoration(
        image: DecorationImage(image:
        AssetImage("assets/film_poster.png"))
      ),
        ),
        const PositionedDirectional(
          top: 10,
          child: ImageIcon(
            AssetImage("assets/bookmark.png"),
            color: AppTheme.grey,size: 20,),
        ),
      // Icon(Icons.bookmark_add_rounded,size: 27,
      // color: AppTheme.bookMarkColor,)
      ],
      ),
    );
  }
}
