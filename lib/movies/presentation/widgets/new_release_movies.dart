import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/movies/presentation/widgets/new_release_widget.dart';

import 'package:shimmer/shimmer.dart';
import '../../../core/utils/app_theme.dart';
import '../../../core/utils/widgets/error_widget.dart';
import '../../../movie_detials/presentation/screens/movie_detials.dart';
import '../../domain/entities/movie.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_states.dart';
// class NewReleaseListView extends StatelessWidget {
//   const NewReleaseListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   BlocBuilder<MovieBloc, MoviesState>(
//       buildWhen: (previous,  current)=>
//       previous.newReleaseRequestState!=
//           current.newReleaseRequestState,
//       builder: (context, state) {
//         switch (state.newReleaseRequestState) {
//           case RequestState.loading:
//             return
//               Expanded(child:
//               ListView.separated(
//                 padding: const EdgeInsets.only(left: 16.0),
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Shimmer(child:
//                   Stack(
//                     alignment: Alignment.topLeft,
//                     children: [
//                       Container(
//                        color: AppTheme.lightGray,
//                         width: MediaQuery.of(context).size.width*0.3,
//                         height: MediaQuery.of(context).size.height*0.2,
//                       ),
//                       Image.asset("assets/images/bookmark.png",
//                         height: 40.h,
//                         fit: BoxFit.fill,)
//
//                     ],
//
//
//                   )  ,
//                       gradient: LinearGradient
//                         (colors: [AppTheme.grey,AppTheme.lightGray]))
//                    ;},
//                 separatorBuilder: (context, index) =>
//                     SizedBox(width: 20.w),
//                 itemCount: state.newReleaseMovies.length,
//                 // Fixed number of placeholders
//               ),
//             );
//           case RequestState.loaded:
//             return
//               Expanded(child: ListView.separated
//                 (
//                     padding: EdgeInsets.only(left: 16.0),
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: (){
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context)=>MovieDetialsScreen(
//                                 movieId: state.newReleaseMovies[index].
//                                 id,
//                               )));
//                         },
//                         child: NewReleaseWidget(
//                           movie: state.newReleaseMovies[index],
//                         )
//
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return SizedBox(width: 20.w,);
//                     },
//                     itemCount: state.newReleaseMovies.length),
//               );
//           case RequestState.error:
//             return ErrorToLoadDataWidget();
//         }
//         return Container();
//       },
//     );
//   }
// }


class NewReleaseListView extends StatelessWidget {
  const NewReleaseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesState>(
      buildWhen: (previous, current) =>
      previous.newReleaseRequestState !=
          current.newReleaseRequestState,
      builder: (context, state) {

   switch (state.newReleaseRequestState) {
          case RequestState.loaded:
            return Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 16.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MovieDetialsScreen(
                            movieId: state.newReleaseMovies[index].id,
                          ),
                        ),
                      );
                    },
                    child: NewReleaseWidget(
                      movie: state.newReleaseMovies[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 20.w),
                itemCount: state.newReleaseMovies.length,
              ),
            );
     case RequestState.loading:
       return Expanded(
         //height: 200.h,
         child: ListView.separated(
           padding: const EdgeInsets.only(left: 16.0),
           scrollDirection: Axis.horizontal,
           itemBuilder: (context, index) {
             return
               Shimmer.fromColors(
                 baseColor: CupertinoColors.lightBackgroundGray,
                 highlightColor: AppTheme.lightGray,
                 child: Stack(
                   alignment: Alignment.topLeft,
                   children: [
                     Container(
                       color: AppTheme.lightGray,
                       width: MediaQuery.of(context).size.width * 0.3,
                       height: 127.h,
                     ),
                     Container(
                       width: 40.h,
                       height: 40.h,
                       color: AppTheme.lightGray, // Bookmark placeholder
                     ),
                   ],
                 ),
               );;
           },
           separatorBuilder: (context, index) => SizedBox(width: 20.w),
           itemCount: 5,
         ),
       );

          case RequestState.error:
            return const ErrorToLoadDataWidget();
          default:
            return Container();
        }
      },
    );
  }
}
