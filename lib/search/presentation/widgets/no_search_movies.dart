import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NoSearchMovies extends StatelessWidget {
  const NoSearchMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox( height: MediaQuery.of(context).size.height*0.25,),
          Image.asset("assets/images/nosearchs.png",
          height: MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width*0.25,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.h,),
      //     Text("No Movies Found",style: TextStyle(
      // fontSize: 24.sp,fontWeight: FontWeight.w600,
      //         fontFamily: GoogleFonts.inter().fontFamily,
      //       color: AppTheme.gray
      //     ),)
        ],
      ),
    );
  }
}
