

import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_theme.dart';

class watchListScreen extends StatelessWidget {
  const watchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("watchList Screen",style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white
        )));
  }
}
