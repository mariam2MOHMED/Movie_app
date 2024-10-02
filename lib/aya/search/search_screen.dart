import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/pages/movie_Detials/view/screens/movie_details_screen.dart';
import 'package:movie_app/shared/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> searchResults = [];
  List<dynamic>suggestion = [];
  bool isLoading = false;
  bool noResults = false;
  
  Future<void> searchMovies(String query) async {
   if(query.isEmpty)return;

    final apiKey = 'ffc1f879898e670e13d37297ed30bbbc';
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query';

    setState(() {
      isLoading = true;
      noResults = false;
    });

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];
      setState(() {
        searchResults = results;
        suggestion = searchResults;
        isLoading = false;
        noResults = results.isEmpty;
      });
    } else {
      
      setState(() {
        isLoading = false;
        noResults = true;
      }
      );
    }
  }
  void UpdateSuggestions (String quary){
    if(quary.isNotEmpty){
      searchMovies(quary);
    } else{
      setState(() {
        suggestion = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Search Screen',
        style: GoogleFonts.abhayaLibre(
              fontWeight: FontWeight.bold, 
              fontSize: 25,
               color: Colors.white,
               ),
        ),
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Movie Name...',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                 // borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search)
              ),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              onChanged: (query){
                UpdateSuggestions(query);
              },
              onSubmitted: (query){
                if(query.isNotEmpty){
                  searchMovies(query);
                }
              },
            ),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : noResults 
              ?
          Center(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.menu_rounded,size: 50,color: AppTheme.grey,),
                    SizedBox(height: 16.h,),
                    Text(
                      'No Results Found',
                      style: GoogleFonts.abhayaLibre(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                )

              )
              : Expanded(
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final movie = searchResults[index];
                      return
                        ListTile(

                        leading: movie['poster_path'] != null
                            ?
                        CachedNetworkImage(imageUrl:
                        'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width*0.35,
                          height:MediaQuery.of(context).size.width*0.2,
                            placeholder: (context, url) =>
                                Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Icon(Icons.menu_rounded,
                                  size: 40,color: Colors.grey,)
                        ))

                            : SizedBox(),
                        title: Text(movie['title'] ?? 'No title',
                         style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),),
                        subtitle: Text(movie['release_date'].toString().
                        substring(0,4) ?? 'Unknown',
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                         id: movie['id'],
                        ),
                      ),
                    );
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

