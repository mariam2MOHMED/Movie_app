import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app/pages/home_screen/view/widgets/book_mark.dart';
import 'package:movie_app/pages/movie_Detials/view/screens/movie_details_screen.dart';
import 'package:movie_app/pages/watch_list/view/widget/watch_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/request.dart';
import '../../../../shared/services/services_locator.dart';
import '../../../../shared/theme/theme.dart';
import '../../cubit/search_bloc.dart';

class searchScreen extends StatelessWidget {
  final SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {

          // Access search results from state
          final searchResults = state.search;

          return Column(
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
                  controller: searchController,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  onChanged: (query) =>
                      context.read<SearchBloc>().add(GetSearchEvent(query: query)),
                  decoration: InputDecoration(
                    hintText: 'Enter Movie Name',
                    hintStyle: TextStyle(
                      color: AppTheme.white,
                      fontSize: 16.sp,
                    ),
                    prefixIcon: Icon(Icons.search, color: AppTheme.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: state.searchState == RequestState.loading
                    ? Center(child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppTheme.grey,
                size: 70.sp
                )) // Show loading indicator
                    : searchResults.isEmpty
                    ?   Center(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_rounded,size: 50,color: AppTheme.grey,),
                        SizedBox(height: 16.h,),
                        Text(
                          'No Results Found',
                          style: GoogleFonts.abhayaLibre(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      ],
                    )

                )
                    : ListView.separated(
                  itemBuilder: (context, index) {
                    final movie = searchResults[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder:
                              (context)=>MovieDetailsScreen(id: movie.id)))
                        ;
                      },
                      child:
                      ListTile(

                        leading: movie.backDropPath != null
                            ?
                        Stack(
                          children: [
                            CachedNetworkImage(imageUrl:
                            'https://image.tmdb.org/t/p/w200${movie.backDropPath}',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width*0.35,
                                height:MediaQuery.of(context).size.width*0.2,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: Icon(Icons.menu_rounded,
                                          size: 40,color: Colors.grey,)
                                    )),

                          ],
                        )

                            : SizedBox(),
                        title: Text(movie.title ?? 'No title',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(movie.releaseDate.toString()?? 'Unknown',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              children: [
                                Icon(Icons.star,color: AppTheme.gold,size: 12.sp,),
                                SizedBox(width: 3.w,),
                                Text(movie.voteAverage.toString().substring(0,3)?? 'Unknown',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsScreen(
                                id: movie.id,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: searchResults.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}