import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/core/utils/app_theme.dart';

class CustomBtn extends StatelessWidget {
  final String title;final void Function() onPressed;
   CustomBtn({ required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style:TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical:20
          ),
          backgroundColor: AppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r)
          )
        ) ,

        onPressed: onPressed,
        child: Center(
          child: Text(title,style:
          Theme.of(context).textTheme.headlineLarge,),
        ));
  }
}
