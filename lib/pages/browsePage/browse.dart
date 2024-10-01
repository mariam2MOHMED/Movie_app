
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/pages/home_screen/api/api_constant.dart';
import 'package:movie_app/shared/theme/theme.dart';

import 'api_service.dart';
import 'movies_by_genre_screen.dart';


class BrowseCategoriesScreen extends StatefulWidget {
  @override
  _BrowseCategoriesScreenState createState() => _BrowseCategoriesScreenState();
}

class _BrowseCategoriesScreenState extends State<BrowseCategoriesScreen> {
  List<dynamic> genres = [];
  List<String>browseImages=[
    'assets/action.png',
    'assets/adventure.png',
    'assets/animation.png',
    'assets/comedy.png',
    'assets/crime.png',
    'assets/documentary.png',
    'assets/drama.png',
    'assets/family.png',
    'assets/fantasy.png',
    'assets/history.png',
    'assets/horror.png',
    'assets/music.jpg',
    'assets/mystery.png',
    'assets/remonatic.jpg',
    'assets/science fiction.png',
    'assets/tv movie.png',
    'assets/thriller.png',
    'assets/war.png',
    'assets/western.png'
  ];

  @override
  void initState() {
    super.initState();
    fetchGenres();
  }

  Future<void> fetchGenres() async {
    try {
      final fetchedGenres = await ApiService().getGenres();
      setState(() {
        genres = fetchedGenres;
      });
    } catch (e) {
      print('Error fetching genres: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse Screen',
          style: TextStyle(
              fontWeight: 
              FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: genres.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MoviesByGenreScreen(
                          genreId: genres[index]['id'],
                          genreName: genres[index]['name'], 
                        ),
                      ),
                    );
                  },
                  child: GridTile(
                    child:Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(browseImages[index],
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        height:MediaQuery.of(context).size.height*0.2 ,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color:Colors.grey[700] ,
                          child: Text(

                            genres[index]['name'],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                          color:AppTheme.white,

                            fontSize:16.sp
                          ),),
                        )
                      ],
                    )
                    // Container(
                    //  decoration: BoxDecoration(
                    //
                    //    image: DecorationImage(
                    //        image:AssetImage(browseImages[index])
                    //       )
                    //  ),
                    //   padding: EdgeInsets.all(10),
                    //   child: Center(
                    //     child: Text(
                    //       genres[index]['name'],
                    //       style: TextStyle(color: Colors.white, fontSize: 18),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                  ),
                );
              },
            ),
    );
  }
}