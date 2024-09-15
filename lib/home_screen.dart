import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/theme/app_theme.dart';
import 'package:movie_app/view/Home_screen.dart';
import 'package:movie_app/view/browse.dart';
import 'package:movie_app/view/search_screen.dart';
import 'package:movie_app/view/wish_list.dart';
class homeScreen extends StatefulWidget {
  static const String routeName="/homeScreen";


  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<Widget>tabs=[
    HomeScreen(),
    searchScreen(),
    BrowseScreen(),
    watchListScreen()
  ];
  int currIndex=0;
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
                ("assets/Path 28.png")),label: 'WatchList'),
        ],
      ),
body:tabs[currIndex],

    );
  }
}
