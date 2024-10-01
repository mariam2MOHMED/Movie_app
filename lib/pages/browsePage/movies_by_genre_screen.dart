
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/pages/movie_Detials/view/screens/movie_details_screen.dart';
import 'package:movie_app/pages/home_screen/view/widgets/book_mark.dart';
import 'package:shimmer/shimmer.dart';
import 'api_service.dart';

class MoviesByGenreScreen extends StatefulWidget {
  final int genreId;
  final String genreName; 

  MoviesByGenreScreen({required this.genreId, required this.genreName}); 

  @override
  _MoviesByGenreScreenState createState() => _MoviesByGenreScreenState();
}

class _MoviesByGenreScreenState extends State<MoviesByGenreScreen> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMoviesByGenre();
  }

  Future<void> fetchMoviesByGenre() async {
    try {
      final fetchedMovies =
          await ApiService().getMoviesByGenre(widget.genreId);
      setState(() {
        movies = fetchedMovies;
      });
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.genreName} Movies',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white)),
      ),
      body: movies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width*0.35,
                        height: MediaQuery.of(context).size.height*0.3,

                        imageUrl:
                            'https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}',
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Icon(Icons.menu_rounded,
                            size: 40,color: Colors.grey,)

                        ),
                        errorWidget: (context, url, error) => Icon(
                            Icons.image_not_supported_rounded),
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                      ),
                      // bookMark()
                    ],
                  ),
                  title: Text(
                    movies[index]['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    'Rating: ${(movies[index]['vote_average']).toString().substring(0,3)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                         id: movies[index]['id'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
