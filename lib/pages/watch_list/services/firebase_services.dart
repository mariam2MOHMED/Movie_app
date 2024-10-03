
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/models/watchList.dart';

class WatchListService {

static  final auth  =FirebaseAuth.instance;
    static Future<void>addToWatchList(String backDropPath,
    String title,String releaseDate)async{
  await FirebaseFirestore.instance.collection('Users')
      .doc(auth.currentUser!.uid).collection('watchlist').add(
      {'backDropPath': backDropPath,
        'releaseDate':releaseDate
        ,'title':title,});
}
}