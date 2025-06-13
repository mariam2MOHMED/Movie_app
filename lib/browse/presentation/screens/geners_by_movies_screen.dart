import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/browse/presentation/widget/gener_by_movie.dart';
import 'package:moviesapp/core/utils/app_theme.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/movie_detials/presentation/screens/movie_detials.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/utils/widgets/error_widget.dart';
import '../../domain/use_cases/get_gener_list_use_case.dart';
import '../../domain/use_cases/get_movies_by_geners_use_case.dart';
import '../controller/gener_bloc.dart';

class GenersByMoviesScreen extends StatelessWidget {
  int? generByMovieId;
  GenersByMoviesScreen({  this.generByMovieId});
 static String routeName="/GenersByMoviesScreen";
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
          GenerBloc(getit<GetGenerListUseCase>(),
              getit<GetMoviesByGenersUseCase>())..add(GetGenerListEvent())..add(GetMoviesByGenersEvent(
              generByMovieId: generByMovieId!)),
      child: BlocBuilder<GenerBloc, GenerState>(
        builder: (context, state) {
          switch(state.moviesByGenersState){

            case RequestState.loading:
              return Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.4,),
                    LoadingAnimationWidget.threeArchedCircle(
                        color: AppTheme.lightGray,
                        size: 60.sp),
                  ],
                ),
              );
            case RequestState.loaded:
            return Scaffold(
              backgroundColor: AppTheme.bg,
              appBar: AppBar(
                backgroundColor: AppTheme.bg,
                title: Text(""),
                iconTheme: IconThemeData(
                    color: Colors.white
                ),
                titleTextStyle: TextStyle(
                    color: Colors.white, fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              body: ListView.separated(
                  itemCount: state.moviesByGeners.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 2.h,
                      color: Color(0xff707070),
                      margin: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>MovieDetialsScreen(
                              movieId: state.moviesByGeners[index].
                              id,
                            )));
                      },
                      child: GenerByMovie(
                        generByMovies: state.moviesByGeners[index],
                      ),
                    );
                  }),
            );
            case RequestState.error:
              return ErrorToLoadDataWidget();
          }

        },
      ),
    );
  }
}
