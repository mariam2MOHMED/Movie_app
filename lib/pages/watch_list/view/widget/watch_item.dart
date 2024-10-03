import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app/pages/home_screen/api/api_constant.dart';
import 'package:movie_app/pages/movie_Detials/view/screens/movie_details_screen.dart';
import 'package:movie_app/shared/theme/theme.dart';

import '../../bloc/view_model/watch_list_view_model.dart';
import '../../bloc/watch_list_states.dart';
import 'package:movie_app/pages/home_screen/data/models/movie.dart';

class WatchItem extends StatefulWidget {
  Movie movie;
  WatchItem({required this.movie});
  @override
  State<WatchItem> createState() => _WatchItemState();
}

class _WatchItemState extends State<WatchItem> {
  WatchListViewModel viewModel = WatchListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchListViewModel,MoviesState>(
        listener: (context,state){
          if(state is FinishState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.finishMessage))
            );
          }
        },
        bloc: viewModel,
        builder: (context,state){
          return Container(
            height:120,

            child: Slidable(
              closeOnScroll: true,
              startActionPane: ActionPane(
                  extentRatio: .20,
                  motion: DrawerMotion(),
                  children: [
                    SlidableAction(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)
                      ),
                      onPressed: (context){
                        viewModel.removeMovieFromFireStore(widget.movie);
                      },
                      backgroundColor:AppTheme.gold,
                      foregroundColor: AppTheme.white,
                      icon: Icons.delete,
                      label:"Delete",
                      padding: EdgeInsets.all(10),
                    )
                  ]),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>
                          MovieDetailsScreen(id: widget.movie!.id!,)));
                },
                child: Container(decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: AppTheme.black.withOpacity(.8),
                          blurRadius: 10,
                          spreadRadius: 6
                      )
                    ]
                ),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            // Base image
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    topRight: Radius.circular(15)
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:  ApiConstant.baseImageUrl+widget.movie.posterPath!,
                                  placeholder: (context, url) => Center(
                                    child:
                                    LoadingAnimationWidget.staggeredDotsWave(
                                      color: AppTheme.white,
                                      size: 50,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width*.3,// Ensures the image covers the entire container// Makes the image fill the height of its container
                                  height: MediaQuery.of(context).size.height*.3,// Ensures the image covers the entire container// Makes the image fill the height of its container
                                )

                            ),
                            // Overlay icon
                            Positioned(
                                top: -6,
                                left: -7,
                                child: BookMarkWidget(  widget.movie,)
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        width: 200,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.movie.title??'',style: TextStyle(color: AppTheme.white),maxLines: 3,softWrap: true,),
                            Text(
                              widget.movie.overView ?? 'No Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 10),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),// movie name
                            Row(
                              children: [
                                Icon(Icons.star,size: 20,color: AppTheme.gold,),
                                SizedBox(width: 5,),
                                Text(widget.movie.voteAverage!.toStringAsFixed(1),
                                    style: TextStyle(color: AppTheme.white,fontSize: 12)),
                                SizedBox(width: 5,),
                                Icon(Icons.date_range,size: 17,color: AppTheme.gold,),
                                SizedBox(width: 5,),
                                Text(widget.movie.releaseData??"",
                                    style: TextStyle(color: AppTheme.white,fontSize: 12)),    //relasse data

                              ],

                            )//actors names

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }


}
class BookMarkWidget extends StatefulWidget {

  Movie movie ;
  BookMarkWidget( this.movie);

  @override
  State<BookMarkWidget> createState() => _BookMarkWidgetState();
}

class _BookMarkWidgetState extends State<BookMarkWidget> {
  WatchListViewModel viewModel = WatchListViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllMoviesFromFireStore();

  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchListViewModel,MoviesState>(
      bloc: viewModel,
      builder:(context, state) {
        if(state is SuccessState){
          bool isBooked=state.movieList.any((watchListMovie){
            return watchListMovie.id==widget.movie.id;
          });
          return  InkWell(
            onTap: (){
              if(!isBooked) {
                viewModel.addMovieToFireStore(widget.movie);
              }else{
                viewModel.removeMovieFromFireStore(widget.movie);
              }
            },
            child: Stack(alignment: Alignment.center,
                children:[
                  ImageIcon(
                    AssetImage('assets/bookmark.png'),
                    size: 40, // Adjust size as needed
                    color:isBooked? AppTheme.gold:AppTheme.bookMarkColor, // Adjust color as needed
                  ),
                  ImageIcon(isBooked?
                  AssetImage('assets/check_icon.png'):
                  AssetImage('assets/add_icon.png'),
                    size: 20, // Adjust size as needed
                    color: Colors.white, // Adjust color as needed
                  )

                ]
            ),
          );
        }
        return SizedBox.shrink();
      } ,
      listener:(context, state) {
        if (state is FinishState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.finishMessage)));
        }
      } ,

    );
  }

}
