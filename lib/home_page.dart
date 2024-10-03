import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/pages/browse/view/screens/browse_screen.dart';

import 'package:movie_app/pages/home_screen/view/screens/Home_screen.dart';
import 'package:movie_app/pages/home_screen/data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_app/pages/home_screen/data/repository/base_movie_repositry.dart';
import 'package:movie_app/pages/home_screen/data/repository/movie_repositry.dart';
import 'package:movie_app/pages/home_screen/view_model/new_release_movie.dart';
import 'package:movie_app/pages/home_screen/view_model/papular_view_model.dart';
import 'package:movie_app/pages/home_screen/view_model/recommended_view_model.dart';
import 'package:movie_app/pages/search/view/screens/search_screen.dart';

import 'package:movie_app/pages/watch_list/view/screens/watch_list.dart';
class HomePage extends StatefulWidget {
  static const String routeName="/homeScreen";


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget>tabs=[
    HomeScreen(),
    searchScreen(),
    BrowseScreen(),
    WatchList()
  ];
  int currIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index){
          currIndex=index;
          setState(() {});
        },
        items: [
BottomNavigationBarItem(
    icon: ImageIcon(AssetImage("assets/Home icon.png")),
    label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage("assets/search-2.png")),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/Icon material-movie.png")),label: 'Browse'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage
                ("assets/Path 28.png")),
              label: 'WatchList'),
        ],
      ),
body:tabs[currIndex],

    );
  }

}
