import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/shared/theme/theme.dart';

class customAuthTextField extends StatelessWidget {
  var controller=TextEditingController();
  String label;
  bool isPassword;
IconData prefixIcon;


   customAuthTextField({
required this.controller,
     required this.label,
     required this.isPassword,
     required this.prefixIcon,

     super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppTheme.white,
      ),
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        prefixIcon: Icon(prefixIcon ,color: AppTheme.gold,),
        suffixIcon: isPassword==true?Icon(CupertinoIcons.eye_fill
        ,color: AppTheme.gold,):null,

      ),
    );
  }
}
