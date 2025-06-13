import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieType extends StatelessWidget {
final  String title;
   MovieType({required this.title});

  @override
  Widget build(BuildContext context) {
    return     Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
            bottom:BorderSide(
                color: Color(0xff514F4F),
                width: 1.w
            ) ,
            left: BorderSide(
                color: Color(0xff514F4F),
                width: 1.w
            ),
            right: BorderSide(
                color: Color(0xff514F4F),
                width: 1.w
            ),
            top: BorderSide(
                color: Color(0xff514F4F),
                width: 1.w
            )
        ),
        borderRadius: BorderRadius.circular(4),
        color: Colors.transparent,

      ),

      child:Text(title,style: Theme.of(context).textTheme.headlineSmall!
          .copyWith(
        color: Color(0xffCBCBCB),
      ),) ,
    );
  }
}
