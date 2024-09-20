import 'package:flutter/material.dart';

import '../shared/theme/theme.dart';


class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(  
          // minimumSize: Size(20,40),
          elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: AppTheme.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(width: 1, color: AppTheme.bookMarkColor))),
        child: const Text("Action"));
  }
}
