class Movie {
   final String title;
  final String posterPath;
  final int year;
final int id;
  Movie({
    required this.title,
    required this.posterPath,
    required this.year,
    required this.id
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      id: json['id'],
      posterPath: json['poster_path'] ?? '',
      year: DateTime.parse(json['release_date']).year,
    );
  }
}