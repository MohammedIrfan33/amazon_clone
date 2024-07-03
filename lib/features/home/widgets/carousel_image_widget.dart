import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImageWidget extends StatelessWidget {
  const CarouselImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((e) => Image.network(e,height: 200,fit: BoxFit.cover,),).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200

      ),

    );
  }
}