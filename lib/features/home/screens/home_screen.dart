import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/carousel_image_widget.dart';
import 'package:amazon_clone/features/home/widgets/top_categoriese.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: Icon(Icons.search),
                  )),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          AddressBox(),
          SizedBox(
            height: 10,
          ),
          TopCategoriese(),
          SizedBox(
            height: 10,
          ),
          CarouselImageWidget()
        ],
      ),
    );
  }
}
