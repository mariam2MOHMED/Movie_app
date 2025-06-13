import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_theme.dart';

class CustomTxtFormField extends StatefulWidget {
 final String? Function(String?)? validator;final
 bool isPassword;
 final String hint;
 final IconData icon;
final TextEditingController controller;
   CustomTxtFormField({ this.validator,
      this.isPassword=false,
     required this.hint,
     required this.icon,required this.controller});

  @override
  State<CustomTxtFormField> createState() => _CustomTxtFormFieldState();
}

class _CustomTxtFormFieldState extends State<CustomTxtFormField> {
  bool obsecure=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
   validator:widget.validator ,
   style: TextStyle(
     fontSize: 15.sp,color: AppTheme.white
   ),
   obscureText: obsecure,
   decoration: InputDecoration(
     hintText: widget.hint,
     hintStyle: TextStyle(
       color: Colors.white
     ),

     prefixIcon: Icon(
       widget.icon,color: AppTheme.primaryColor,
     ),
     suffixIcon: widget.isPassword==true?IconButton(onPressed: (){
       obsecure=!obsecure;setState(() {

       });
     }, icon:
     Icon(
   obsecure==true?CupertinoIcons.eye_slash_fill:
       CupertinoIcons.eye_fill,color: AppTheme.primaryColor,
     )):null,
     border: OutlineInputBorder(
       borderRadius: BorderRadius.circular(24.r),

     )
   ),
    );
  }
}
