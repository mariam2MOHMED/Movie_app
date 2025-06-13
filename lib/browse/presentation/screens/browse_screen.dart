import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/browse/domain/use_cases/get_gener_list_use_case.dart';
import 'package:moviesapp/core/utils/app_theme.dart';
import 'package:moviesapp/core/utils/service_locator.dart';
import 'package:moviesapp/core/utils/widgets/error_widget.dart';

import '../../../core/utils/enum.dart';
import '../../domain/use_cases/get_movies_by_geners_use_case.dart';
import '../controller/gener_bloc.dart';
import '../widget/browse_widget.dart';
import 'geners_by_movies_screen.dart';

class BrowseScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
        GenerBloc(getit<GetGenerListUseCase>(), 
            getit<GetMoviesByGenersUseCase>())..add(GetGenerListEvent()),
      child: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h,),
            Text("Browse Category ", style:
            Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16.h,),
            BlocBuilder<GenerBloc, GenerState>(
              builder: (context, state) {
                switch(state.generListState){

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
                  return Expanded(
                    child: GridView.builder(
                        itemCount:  state.genersList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                           crossAxisSpacing: 15.0
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>
                                      GenersByMoviesScreen(
                                    generByMovieId:
                                    state.genersList[index].id,
                                  )));

                            },
                            child: BrowseWidget(
                              image:images[index],
                              genereList: state.genersList[index],),
                          );
                        }),
                  );
                  case RequestState.error:
               return ErrorToLoadDataWidget();
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}
List<String>images=[
  "assets/images/action.png",
  "assets/images/adventure.png",
  "assets/images/animate.png",
  "assets/images/comedy.png",
  "assets/images/crime.png",
  "assets/images/documentary.png",
  "assets/images/drama.png",
  "assets/images/family.png",
  "assets/images/fantasy.png",
  "assets/images/history.png",
  "assets/images/horror.png",
  "assets/images/music.jpg",
  "assets/images/mystery.png",
  "assets/images/remonatic.jpg",
  "assets/images/science fiction.png",
  "assets/images/tv_movies.jpeg",
  "assets/images/thriller.png",
  "assets/images/war.png",
  "assets/images/western.png",
];