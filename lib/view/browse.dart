

import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_theme.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Browse Screen",style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
            color: Colors.white
        ) ,));
  }
}
