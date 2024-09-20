import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../shared/theme/theme.dart';

class newReleaseMovieItem extends StatelessWidget {
  const newReleaseMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 5),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
      children: [

        Image.asset(
          'assets/film_poster.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Image.asset("assets/bookmark.png"),


      ],
      ),
    );
  }
}
