import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import 'movie_card.dart';

class movieCarouselSlider extends StatelessWidget {

   movieCarouselSlider({

    super.key});

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider.builder(itemCount: 10,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
          return movieCard(

          );
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height*0.25,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 2),
          autoPlayCurve: Curves.easeInOutCubicEmphasized,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index,p){

          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
