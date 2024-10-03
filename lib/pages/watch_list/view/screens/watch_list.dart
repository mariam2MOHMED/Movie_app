import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app/shared/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/view_model/watch_list_view_model.dart';
import '../../bloc/watch_list_states.dart';

import '../widget/watch_item.dart';

class WatchList extends StatefulWidget {
  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList>  {
  WatchListViewModel viewModel = WatchListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllMoviesFromFireStore();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color:AppTheme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Watch List",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:
                  ElevatedButton.icon(
                    label: Text("Delete All"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.gold,
                        foregroundColor: AppTheme.white,
                        padding: EdgeInsets.symmetric(horizontal: 10)
                    ),

                    onPressed: (){
                      viewModel.deleteAllFromFireStore();
                    },
                    icon: Icon(Icons.delete),
                  ),
                )
              ],
            ),
            BlocConsumer<WatchListViewModel,MoviesState>(
              listener: (context,state){
                if(state is FinishState){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.finishMessage))
                  );
                }
              },
              bloc:viewModel ,

              builder: (context,state){
                if(state is LoadingState){
                  return LoadingAnimationWidget.staggeredDotsWave(
                    color: AppTheme.white,
                    size: 50,
                  );
                }else if(state is ErrorState){
                  return Expanded(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                       Icon(Icons.menu,size: 70,color: AppTheme.white,),
                        SizedBox(height: 10,),
                        Text(state.errorMessage,style: TextStyle
                          (color:AppTheme.white,),textAlign: TextAlign.center,),
                      ],
                    ),
                  );
                }else if(state is SuccessState) {
                  if (state.movieList.isNotEmpty) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            Divider(
                              thickness: 3, color: AppTheme.grey,
                              endIndent: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.1,
                              indent: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.1,
                            ),
                        itemBuilder: (context, index) =>
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: WatchItem(movie: state.movieList[index],),
                            ),
                        itemCount: state.movieList.length,
                      ),
                    );
                  }else{
                    return Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                        Icon(Icons.menu_outlined,size: 70.sp,color: AppTheme.white,),
                          SizedBox(height: 10,),
                          Text("No Movies",style:
                          GoogleFonts.abhayaLibre(
                            color:AppTheme.white,
                          fontSize:35.sp
                          ),textAlign: TextAlign.center,),
                        ],
                      ),
                    );
                  }
                }
                return Container();
              },

            ),
          ],
        ),
      ),
    );
  }

}
