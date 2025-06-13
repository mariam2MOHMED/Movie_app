import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/auth/presentation/controller/auth_event.dart';

import '../../../auth/domain/use_cases/get_add_movie_to_wishlist_use_case.dart';
import '../../../auth/domain/use_cases/get_delete_movie_use_case.dart';
import '../../../auth/domain/use_cases/get_get_movie_to_wishlist_use_case.dart';
import '../../../auth/domain/use_cases/get_login_use_case.dart';
import '../../../auth/domain/use_cases/get_register_use_case.dart';
import '../../../auth/presentation/controller/auth_bloc.dart';
import '../../../auth/presentation/controller/auth_state.dart';
import '../../../core/utils/app_theme.dart';
import '../../../core/utils/enum.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/utils/widgets/error_widget.dart';
import '../../../movie_detials/presentation/screens/movie_detials.dart';
import '../widgets/watch_list_item.dart';

class WatchListScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>  AuthBloc(
          getit<GetRegisterUseCase>(),
          getit<GetLoginUseCase>(),
          getit<GetAddMovieToWishListUseCase>(),
          getit<GetGetMoviesToWishListUseCase>(),
          getit<GetDeleteMovieToWishListUseCase>())..add(GetGetMoviesEvent(userId:
      FirebaseAuth.instance.currentUser!.uid)),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h,),
              Text("WatchList ", style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,),
              SizedBox(height: 24.h,),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
switch(state.wishlistRequestState){
  case RequestState.loading:
 return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            SizedBox( height: MediaQuery.of(context).size.height*0.25,),
            LoadingAnimationWidget.threeArchedCircle(
                color: AppTheme.gray,
                size: 70.sp),],),);
  case RequestState.loaded:
  return Expanded(
    child: ListView.separated(itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) =>
              MovieDetialsScreen(movieId:
              state.movies[index].id)));
        },
        child: WatchListMovie(
          movie: state.movies[index],
        ),
      );
    },
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
        itemCount: state.movies.length),
  );
  case RequestState.error:
    return ErrorToLoadDataWidget();
}

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}