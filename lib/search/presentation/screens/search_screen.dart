import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/search/data/repositry/search_movie_repositry.dart';
import 'package:moviesapp/search/presentation/controllers/search_movie_bloc.dart';
import 'package:moviesapp/search/presentation/controllers/search_movie_event.dart';
import 'package:moviesapp/search/presentation/controllers/search_movie_states.dart';
import 'package:moviesapp/search/presentation/widgets/search_list_view.dart';

import '../../data/data_source/remote/search_movie_remote_data_source.dart';
import '../../domain/use_case/get_search_movie_use_case.dart';
import '../widgets/custom_search_field.dart';

class SearchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            SearchMoviesBloc(GetSearchMovieUseCase
              (searchMovieRepositry: SearchMovieRepositry(
                baseSearchMovieRemoteDataSource:
                SearchMovieRemoteDataSource()))),
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            BlocBuilder<SearchMoviesBloc, SearchMovieState>(
              builder: (context, state) {
                return CustomSearchField(onChanged: (query) {
                  context.read<SearchMoviesBloc>()
                      .add(GetSearchMovieEvent(query: query));
                });
              },
            ),
            SizedBox(height: 16.h,),
         SearchListView()
          ],
        ),
      ),
    );
  }
}
