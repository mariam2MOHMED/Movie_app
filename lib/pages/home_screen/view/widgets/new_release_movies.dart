import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/pages/home_screen/api/api_constant.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_bloc.dart';
import 'package:movie_app/pages/home_screen/cubit/movies_state.dart';
import '../../../../shared/theme/theme.dart';
// class newReleaseMovieItem extends StatelessWidget {
//   const newReleaseMovieItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10,top: 5),
//       child:
//       GestureDetector(
//         onTap: (){},
//         child: Stack(
//           alignment: AlignmentDirectional.topStart,
//         children: [
//
//           Image.asset(
//             'assets/film_poster.png',
//             fit: BoxFit.cover,
//             width: MediaQuery.of(context).size.width * 0.25,
//             height: MediaQuery.of(context).size.height * 0.2,
//           ),
//           Image.asset("assets/bookmark.png"),
//
//
//         ],
//         ),
//       ),
//     );
//   }
// }
class newReleaseComponent extends StatelessWidget {
  const newReleaseComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<MoviesBloc,MoviesStates>(
builder: (context,state){
  return  Container(
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
                final movie=state.newReleeaseMovies[index];
                return    Padding(
                  padding: const EdgeInsets.only(left: 10,top: 5),
                  child:
                  GestureDetector(
                    onTap: (){},
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [

                        CachedNetworkImage(
                          imageUrl: ApiConstant.imageurl(movie.backdropPath),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.2,
                          errorWidget: (context,url,error)=>Icon(
                              Icons.image_not_supported
                          ,color: AppTheme.grey,size: 35,),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Image.asset("assets/bookmark.png")),


                      ],
                    ),
                  ),
                );;
              }, separatorBuilder: (context,index){
            return SizedBox(width: 5.w,);
          }, itemCount: state.newReleeaseMovies.length),
        ),
      ],
    ),
  );
},


    );
  }
}

