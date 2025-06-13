import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'package:moviesapp/auth/data/models/user_model.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';

import '../../../core/utils/errors/error_firebase.dart';
import '../../../movies/data/models/movie_model.dart';



abstract class AuthDataSource{
  Future<Either<ErrorFirebase,UserModel>>login
      (String email, String password);
  Future<Either<ErrorFirebase,UserModel>>register({required String name,required String email,required String password});
  Future<Either<ErrorFirebase,MovieModel>>addMovieToWishList
      (Movie movieModel,String userId);
  Future<Either<ErrorFirebase,List<Movie>>>getMovieToWishList
      (String userId);
  Future<Either<ErrorFirebase,void>>deleteMovieFromWishList
      (String userId,Movie movie);
}
// class AuthRemoteDataSource extends AuthDataSource{
//   @override
//   Future<Either<ErrorFirebase, UserModel>> login
//   (String email, String password) async {
//    try{
//      final crediential=await FirebaseAuth.instance.signInWithEmailAndPassword
//        (email: email, password: password);
//      final user=getUserColl();
//      final doc=await user.doc(crediential.user!.uid).get();
//      final userModel=doc.data()! as UserModel;
//      return right(userModel);
//    }catch(error){
//      if(error is FirebaseAuthException){
//        return left(ErrorFirebase.fromFirebase(error));
//      }else{
//        return left(ErrorFirebase(errorMessage: "Error in login ${error.toString()}"));
//      }
//    }
//   }
//
//
//   @override
//   Future<Either<ErrorFirebase, UserModel>> register
//       ({required String name, required String email,
//     required String password}) async{
//    try{
//      final crediential=await FirebaseAuth.instance.createUserWithEmailAndPassword
//        (email: email, password: password);
//      final user=getUserColl();
//      final userModel=UserModel(id: crediential.user!.uid, name: name,
//          email: email, password: password);
//      final doc=await user.doc(crediential.user!.uid).
//      set(userModel);
//      return right(userModel);
//    }catch(error){
//      if(error is FirebaseAuthException){
//        return left(ErrorFirebase.fromFirebase(error));
//      }else{
//        return left(ErrorFirebase(errorMessage: "Error in register ${error.toString()}"));
//
//      }
//    }
//   }
//
//   @override
//   Future<Either<ErrorFirebase, MovieModel>>
//   addMovieToWishList(Movie movieModel,int userId) async{
//   try{
//     CollectionReference<Movie> tasksColl=
//     getWishListColl(userId);
//     DocumentReference<Movie>  doc=tasksColl.doc();
//     doc.id!=movieModel.id;
//     final   movie= doc.set(movieModel) as MovieModel;
//     return right(movie);
//   }catch(error){
//
//       return left(ErrorFirebase(errorMessage: "error in add movie in wishlist ${error}"));
//
//   }
//   }
//
//   @override
//   Future<Either<ErrorFirebase, List<Movie>>>
//   getMovieToWishList(int userId) async {
//    try{
//      CollectionReference<Movie> moviesColl=
//      getWishListColl(userId);
//     QuerySnapshot<Movie> querysnap=await moviesColl.get();
//      List<Movie>movies=
//      querysnap.docs.map((e) => e.data()).toList() ;
//      return right(movies);
//    }catch(error){
//      return left(ErrorFirebase(errorMessage: "error in get movies ${error}"));
//
//    }
//   }
//
// }
// CollectionReference getUserColl()=>  FirebaseFirestore.instance.collection("user").
//  withConverter<UserModel>(fromFirestore: (snapshot,_)=>UserModel.
//  fromJson(snapshot.data()!),
//      toFirestore: (usermodel,_)
//      =>usermodel.toJson());
// CollectionReference<Movie> getWishListColl(int userId)=>getUserColl().doc(userId.toString()).collection
// ("wishlist").withConverter<MovieModel>
// (fromFirestore: (snapShot,_)=>MovieModel.fromJson(snapShot.data()!),
// toFirestore: (movie,_)=>movie.toJson());
class AuthRemoteDataSource extends AuthDataSource {
  @override
  Future<Either<ErrorFirebase, UserModel>> login(String email,
      String password) async {
    try {
      final credential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = getUserColl();
      final doc = await user.doc(credential.user!.uid).get();
      final userModel = doc.data()!;
      return right(userModel);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(ErrorFirebase.fromFirebase(error));
      } else {
        return left(ErrorFirebase(errorMessage: "Error in login: $error"));
      }
    }
  }

  @override
  Future<Either<ErrorFirebase, UserModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.
      createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = getUserColl();
      final userModel = UserModel(
        id: credential.user!.uid,
        name: name,
        email: email,
        password: password,
      );
      await user.doc(credential.user!.uid).set(userModel);
      return right(userModel);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(ErrorFirebase.fromFirebase(error));
      } else {
        return left(ErrorFirebase(errorMessage: "Error in register: $error"));
      }
    }
  }

  @override
  Future<Either<ErrorFirebase, MovieModel>> addMovieToWishList(Movie
  movieModel, String userId) async {
    try {
      final tasksColl = getWishListColl(userId.toString());
      final doc = tasksColl.doc(movieModel.id.toString()); // Use movie ID as document ID
      await doc.set(movieModel as MovieModel); // Ensure movieModel is MovieModel
      return right(movieModel);
    } catch (error) {
      return left(ErrorFirebase(errorMessage: "Error adding movie to wishlist: $error"));
    }
  }

  @override
  Future<Either<ErrorFirebase, List<Movie>>> getMovieToWishList
      (String userId) async {
    try {
      final moviesColl = getWishListColl(userId.toString());
      final querysnap = await moviesColl.get();
      final movies = querysnap.docs.map((e) => e.data()).toList();
      return right(movies);
    } catch (error) {
      return left(ErrorFirebase(errorMessage: "Error getting movies: $error"));
    }
  }

  @override
  Future<Either<ErrorFirebase, void>> deleteMovieFromWishList
      (String userId,Movie movie) async{

    try{
      final coll=getWishListColl(userId);
      final delete=await coll.doc(movie.id.toString()).delete();
      return right(delete);
    }catch(error){
      return left(ErrorFirebase(errorMessage: "Error getting movies: $error"));

    }
  }
}

CollectionReference<UserModel> getUserColl() => FirebaseFirestore.instance
    .collection("user")
    .withConverter<UserModel>(
  fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
  toFirestore: (usermodel, _) => usermodel.toJson(),
);

CollectionReference<Movie> getWishListColl(String userId) => getUserColl()
    .doc(userId)
    .collection("wishlist")
    .withConverter<MovieModel>(
  fromFirestore: (snapShot, _) => MovieModel.fromJson(snapShot.data()!),
  toFirestore: (movie, _) => movie.toJson(),
);