import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/search/presentation/screens/search_screen.dart';
import 'package:moviesapp/whish_list/presentation/screens/watch_list_screen.dart';

import 'browse/presentation/screens/browse_screen.dart';
import 'core/utils/app_theme.dart';
import 'movies/presentation/screens/home_screen.dart';

class HomePage extends StatefulWidget {
  static String routeName="/HomePage";
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currindex=0;
  List<Widget>screens=[
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.bg,
body: screens[currindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currindex,
        onTap: (index) {
          currindex = index;
          setState(() {

          });
        },
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor:AppTheme.black ,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            label: 'HOME',
            icon: Icon(Icons.home, size: 20.sp),
          ),
          BottomNavigationBarItem(
            label: 'SEARCH',
            icon: Icon(Icons.search, size: 20.sp),
          ),
          BottomNavigationBarItem(
            label: 'BROWSE',
            icon: ImageIcon(AssetImage("assets/images/Browse_icon.png")),
          ),
          BottomNavigationBarItem(
            label: 'WATCHLIST',
            icon: ImageIcon(AssetImage("assets/images/watch_list_icon.png")),
          ),
        ],
      ),
    );
  }
}
