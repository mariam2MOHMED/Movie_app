import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/widgets/default_elevated_button.dart';
import 'package:movie_app/pages/home_screen/view/widgets/recomended_film.dart';

import 'shared/theme/theme.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = "/movieDetails";
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              " Dora and the lost city of gold",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20),
            ),
          ),
          body: Container(
            // margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Container(
                  color: AppTheme.gold,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/Image_movie.png',
                                ),
                                fit: BoxFit.fill)),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_circle,
                            color: AppTheme.white,
                            size: 50.sp,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    " Dora and the lost city of gold",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    " 2019  PG-13  2h 7m",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .24,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/moviePoster.png",
                            height: 210,
                          ),
                          InkWell(child: Image.asset("assets/bookmark.png"))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                DefaultElevatedButton(),
                                SizedBox(
                                  width: 8,
                                ),
                                DefaultElevatedButton(),

                                // DefaultElevatedButton(),
                              ],
                            ),
                            const DefaultElevatedButton(),
                            // SizedBox(height: 8.h,),
                            Text(
                              "Having spent most of her life exploring\n the jungle,nothing could prepare Dora for \nher most dangerous adventure yet high.",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            // SizedBox(height: 8.h,),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.star_rounded,
                                      size: 38,
                                      color: AppTheme.gold,
                                    )),
                                Text(
                                  "7.7",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        const BoxDecoration(color: AppTheme.containerColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "More Like This",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                              // scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const recomendedMovieItem();
                              },
                              // separatorBuilder: (context, index) {
                              //   return SizedBox(
                              //     width: 5.w,
                              //   );
                              // },
                              itemCount: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
