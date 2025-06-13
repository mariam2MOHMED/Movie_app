import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/core/utils/app_theme.dart';

class CustomSearchField extends StatelessWidget {
  Function(String)? onChanged;
   CustomSearchField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        onChanged: onChanged,
      style: TextStyle(
        color: AppTheme.white,fontSize: 16.sp
      ),
      validator: (value){
          if(value!.isEmpty&&value!=null){
            return "Search must be not empty";
          }else{
            return null;
          }
      },
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(Icons.search,color: AppTheme.white,),
      hintText: 'Search ...',
        hintStyle: TextStyle(
      fontSize: 16.sp,
        color: AppTheme.white,
        fontFamily: GoogleFonts.inter().fontFamily
        ),

        fillColor: AppTheme.darkGrey.withOpacity(0.58),
        border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.w,
          color: AppTheme.white
      ),
      borderRadius: BorderRadius.circular(30.r)
        )
      ),
      ),
    );
  }
}
