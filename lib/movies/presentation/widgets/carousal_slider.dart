import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/core/utils/widgets/error_widget.dart';
import 'package:moviesapp/movie_detials/presentation/screens/movie_detials.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';
import 'package:moviesapp/movies/presentation/controller/movies_bloc.dart';
import 'package:moviesapp/movies/presentation/controller/movies_states.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/widgets/loading_widget.dart';

class ImagesSlider extends StatelessWidget {
  final Movie movie;
  
  ImagesSlider({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Container(
        //height : MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                  child: Image.network(AppConstants.getPathImage(movie.image),
                    width: MediaQuery.of(context).size.width,
                    height: 150.h, // Adjust based on your design
                  fit: BoxFit.cover,
                  ),
                )
         , IconButton(onPressed: (){},
                    icon: Icon(
                  color: Colors.white,
                  Icons.
                play_circle_fill,size: 60,))
              ],
            ),
            SizedBox(height: 10.sp,),
            Padding(
              padding:  EdgeInsets.only(left: 16.0),
              child: Text(movie.title,style: Theme.of(context).textTheme.headlineMedium,),
            )
            , SizedBox(height: 10.sp,),
            Padding(
              padding:  EdgeInsets.only(left: 16.0),
              child: Text("${movie.releaseDate}",
                style: Theme.of(context).
              textTheme.headlineSmall,),
            )

          ],
        ),
      ),
    );
  }
}
class SliderImages extends StatelessWidget {
  const SliderImages({super.key});

  @override
  Widget build(BuildContext context) {
    return

      BlocBuilder<MovieBloc, MoviesState>(
        buildWhen: (previous,  current)=>
        previous.popularRequestState!=current.popularRequestState,
  builder: (context, state) {
    switch(state.popularRequestState ){
      case RequestState.loading:
        return SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
            child: LoadingWidget());
      case RequestState.loaded:
      return CarouselSlider(
            items:state.popularMovies.map((e) => InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>MovieDetialsScreen(
                      movieId: e.id,
                    )));
              },
              child: ImagesSlider(movie:
              e),
            )).toList(),
            options: CarouselOptions(
            height: MediaQuery.of(context).size.height*0.3,
            viewportFraction:1.0,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeFactor: 0.2,
          ));
      case RequestState.error:
        return ErrorToLoadDataWidget();
    }


  },
);
  }
}
