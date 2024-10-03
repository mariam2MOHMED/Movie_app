
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/pages/watch_list/bloc/watch_list_states.dart';


import '../../../home_screen/data/models/movie.dart';
import '../../data/data_sources/watch_list_data_sources.dart';

import '../../data/repositry/watch_list_repositry.dart';
import '../../data/repositry/watch_list_repositry_implemetation.dart';

import 'package:movie_app/pages/home_screen/data/models/movie.dart';
class WatchListViewModel extends Cubit<MoviesState>{
  late WatchListRepository repository;
  late WatchListDataSource dataSource;
  WatchListViewModel():super(LoadingState()){
    dataSource=WatchListDataSourceImpl();
    repository=WatchListRepositoryImpl(dataSource:dataSource );
  }


  Future<void> deleteAllFromFireStore()async{
    await repository.deleteAll();
    emit(FinishState(finishMessage: "All Movies Delete Success"));
  }

  Future<void> addMovieToFireStore(Movie movie) async {
    try {
      var response=await repository.addMovie(movie);
      emit(FinishState(finishMessage: "Added Successfully"));
      getAllMoviesFromFireStore();
    }catch (e){
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getAllMoviesFromFireStore({bool fromWatchlist=false}) async {
    if(fromWatchlist){
      emit(LoadingState());
    }
    try{
      var response=await repository.getAllMovies().listen((movieList){
        emit(SuccessState(movieList:  movieList));
      });
    }catch(e){
      emit(ErrorState(errorMessage:e.toString()));
    }
  }

  Future<void> removeMovieFromFireStore(Movie movie) async {
    try {
      bool response =await repository.removeMovie(movie);
      if(response) {
        emit(FinishState(finishMessage: "Deleted Successfully"));
        getAllMoviesFromFireStore();
      }else{
        emit(ErrorState(errorMessage: 'Something went wrong '));
      }
    }catch (e){
      emit(ErrorState(errorMessage: e.toString()));
    }
  }



}