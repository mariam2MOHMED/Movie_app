import 'package:flutter/material.dart';

class bookMark extends StatelessWidget {
   bookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
        onTap: (){},
        child: Image.asset("assets/bookmark.png"));
  }
}
