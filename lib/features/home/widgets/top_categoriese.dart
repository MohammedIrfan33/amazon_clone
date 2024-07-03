import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:flutter/material.dart';

class TopCategoriese extends StatelessWidget {
  const TopCategoriese({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      child: ListView.builder(
        itemExtent: 70,
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,

        itemBuilder: (context, index) => Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(GlobalVariables.categoryImages[index]['image']!,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                ),
              ),

            ),
            Text(GlobalVariables.categoryImages[index]['title']!,style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400
            ),)

          ],
        ),
        
        ),
    );
  }
}