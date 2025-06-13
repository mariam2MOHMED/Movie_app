import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static const Color primaryColor=Color(0xffF7B539);
  static const Color grey=Color(0xff282A28);
  static const Color bg=Color(0xff121312);
  static const Color lightGray=Color(0xffB5B4B4);
  static const Color white=Color(0xffFFFFFF);
//###CBCBCB
  static const Color black=Color(0xff1A1A1A);
  static const Color gray=Color(0xffCBCBCB);
  static const Color darkGrey=Color(0xff514F4F);
  static ThemeData theme=ThemeData(
    
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: white,
          fontFamily: GoogleFonts.inter().fontFamily
      ),
      titleLarge: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: white,
          fontFamily: GoogleFonts.inter().fontFamily
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
color: white,
fontFamily: GoogleFonts.inter().fontFamily
      ),

      headlineSmall: TextStyle(
          fontSize: 12.sp,
          color: lightGray,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.inter().fontFamily
      ),
    )
  );
}