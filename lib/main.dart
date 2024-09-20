import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/movie_details_screen.dart';

import 'package:movie_app/home_page.dart';
import 'package:movie_app/shared/theme/theme.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      routes: {
          HomePage.routeName:(_)=>HomePage(),
          MovieDetailsScreen.routeName:(_)=>const MovieDetailsScreen()

      },
        initialRoute:   HomePage.routeName,
      ),
    );
  }
}
