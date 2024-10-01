import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/shared/theme/theme.dart';

class customButton extends StatelessWidget {
  String txt;
 void Function()onPressed;
   customButton({
     required this.txt,
     required this.onPressed,
     super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.gold,
          foregroundColor: AppTheme.white,
          fixedSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height*0.06)
        ),
        onPressed: onPressed, child: Text(
      "$txt",style:
    GoogleFonts.abhayaLibre(
      fontSize:20.sp,
      fontWeight:FontWeight.bold,
      color:AppTheme.white
    ),));
  }
}
