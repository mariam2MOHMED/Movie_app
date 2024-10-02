// class WatchListItem {
//   int id;
//   String title;
//   String backDropPath;
//   String releaseData;
//   // Other properties as needed
//
//   WatchListItem({
//     required this.id,
//     required this.releaseData,
//     required this.title,
//     required this.backDropPath});
//
//
//   }
//
// class WatchListModel extends WatchListItem{
//   WatchListModel({required super.id, required super.releaseData, required super.title, required super.backDropPath});
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'id':id ,
//       'backdrop_path':backDropPath,
//       'release_date':releaseData,
//
//       // Other properties as needed
//     };
//   }
//
//   factory WatchListModel.fromJson(Map<String, dynamic> json) {
//     return WatchListModel(
//         title: json['title'],
//         id: json['id'],
//         releaseData: json['release_date'],
//         backDropPath: json['backdrop_path']
//       // Other properties as needed
//     );
// }
// }