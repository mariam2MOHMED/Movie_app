import 'package:flutter/material.dart';

class ErrorToLoadDataWidget extends StatelessWidget {
  const ErrorToLoadDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Some Thing went Wrong",style:
      Theme.of(context).textTheme.headlineLarge,),
    );
  }
}
