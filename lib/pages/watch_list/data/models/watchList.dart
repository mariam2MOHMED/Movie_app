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
class MovieResponse {
  MovieResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MovieResponse.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Dates? dates;
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}

/// adult : false
/// backdrop_path : "/lgkPzcOSnTvjeMnuFzozRO5HHw1.jpg"
/// genre_ids : [16,10751,35,28]
/// id : 519182
/// original_language : "en"
/// original_title : "Despicable Me 4"
/// overview : "Gru and Lucy and their girls—Margo, Edith and Agnes—welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Gru also faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run."
/// popularity : 3270.437
/// poster_path : "/wWba3TaojhK7NdycRhoQpsG0FaH.jpg"
/// release_date : "2024-06-20"
/// title : "Despicable Me 4"
/// video : false
/// vote_average : 7.327
/// vote_count : 1094

class Movie {
  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Movie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}

/// maximum : "2024-09-11"
/// minimum : "2024-08-21"

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  String? maximum;
  String? minimum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }
}