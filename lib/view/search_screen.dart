

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("searchScreen",style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white
        )));
  }
}
