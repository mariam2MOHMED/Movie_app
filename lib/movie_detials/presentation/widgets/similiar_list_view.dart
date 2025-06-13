import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/core/utils/widgets/error_widget.dart';
import 'package:moviesapp/core/utils/widgets/loading_widget.dart';
import 'package:moviesapp/movie_detials/presentation/controller/movie_detials_bloc/movie_detials_state.dart';
import 'package:moviesapp/movie_detials/presentation/widgets/similiar_movie.dart';

import '../controller/movie_detials_bloc/movie_detials_bloc.dart';
import '../screens/movie_detials.dart';

class SimiliarListView extends StatelessWidget {
  const SimiliarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetialsBloc, MovieDetialsState>(
      buildWhen: (previous,  current)=>
      previous.recommendationRequestState!=current.recommendationRequestState,
      builder: (context, state) {
        switch(state.recommendationRequestState){
          case RequestState.loading:
            return Expanded(child: LoadingWidget());
          case RequestState.loaded:
            return Expanded(


              child: ListView.separated

                (
                  padding: EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>MovieDetialsScreen(
                              movieId: state.recommendation[index].
                              id,
                            )));
                      },
                      child: SimilarMovie(
                        recommendation:state.recommendation[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20.w,);
                  },
                  itemCount: state.recommendation.length),
            );
          case RequestState.error:
            return ErrorToLoadDataWidget();
        }
      },
    );
  }
}
