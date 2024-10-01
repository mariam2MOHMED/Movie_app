import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/theme/theme.dart';


class DefaultElevatedButton extends StatelessWidget {
  String txt;
   DefaultElevatedButton({
     required this.txt,
     super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          width: 1.w,
          color: AppTheme.bookMarkColor
        )
      ),
        child:  Text(txt,style: TextStyle(
          fontSize: 12.sp,
          color: AppTheme.white
        ),)
    );

  }
}
