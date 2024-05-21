import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class NonetWorkScreen extends StatelessWidget {
  const NonetWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Lottie.asset('asset/Animation - 1716198764347.json'),
            ),
          
          const Text('No Internet',style: TextStyle(color: Colors.red,fontSize: 20),)
        ],
      ),
    );
  }
}