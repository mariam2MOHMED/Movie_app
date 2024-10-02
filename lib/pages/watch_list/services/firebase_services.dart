//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../data/models/watchList.dart';
//
// class WatchListService {
// static  final CollectionReference watchListCollection =
//   FirebaseFirestore.instance.collection('watchList');
//
//   static Future<void> addItemToWatchList(WatchListModel item) async {
//     try {
//       await watchListCollection.add(item.toJson());
//     } catch (e) {
//       print('Error adding item to watch list: $e');
//     }
//   }
//
// // Other methods for retrieving, updating, and deleting items
// }