import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class AppTheme{
  static const Color primaryColor=Color(0xFF121312);
  static const Color gold=Color(0xFFFFBB3B);
  static const Color white=Color(0xFFFFFFFF);
  static const Color grey=Color(0xFFB5B4B4);//B5B4B4//C6C6C6
  static const Color iconBar=Color(0xFFC6C6C6);
  //1A1A1A
  static const Color black=Color(0xFF1A1A1A);
  //514F4F
  static const Color bookMarkColor=Color(0xFF514F4F);
  static const Color containerColor=Color(0xFF282A28);
  // static const Color recomendedFilm=Color(0xFF707070) ;
  static const Color appBarColor=Color(0xFF1D1E1D);
  static const Color recomendedFilm=Color(0xFF343534) ;
  //343534
  static ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: primaryColor,
      appBarTheme: const AppBarTheme(
          backgroundColor:AppTheme.appBarColor,
          foregroundColor: AppTheme.white
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: white,fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter'
        ),
        headlineSmall: TextStyle(
            color: grey,fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter'
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: gold,
        unselectedItemColor: iconBar,
        type: BottomNavigationBarType.fixed,

      )
  );
}