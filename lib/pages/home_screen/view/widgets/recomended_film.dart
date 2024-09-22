import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/theme/theme.dart';


class recomendedMovieItem extends StatelessWidget {
  const recomendedMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          // height: MediaQuery.of(context).size.height*.3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppTheme.recomendedFilm,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Image.asset(
                    'assets/recomendedfilm.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Image.asset("assets/bookmark.png"),
                  // Container(
                  //   width: MediaQuery.of(context).size.width*.25,
                  //   height: 110.h,
                  //   // decoration: const BoxDecoration(
                  //   //     image: DecorationImage(image:

                  //   //     // AssetImage("assets/recomendedfilm.png"))
                  //   // ),
                  // ),

                  // const PositionedDirectional(

                  //   child: ImageIcon(
                  // AssetImage("assets/bookmark.png"),
                  // color: AppTheme.iconBar,size: 25,),
                  // )
                  // ),
                  // Icon(Icons.bookmark_outline_outlined,size: 27,
                  // color: AppTheme.bookMarkColor,),
                  // IconButton(onPressed: (){}, icon: Icon(Icons.add,color: AppTheme.gold,))
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppTheme.gold,
                    size: 16,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "7.7",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.white, fontWeight: FontWeight.w600),
                  ),

                  //
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                " Deadpool 2",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppTheme.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                " 2018  R  1h 59m",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppTheme.grey, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
