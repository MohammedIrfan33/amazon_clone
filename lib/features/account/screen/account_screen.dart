import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leadingWidth: 120,
          leading:  Image.asset(
            'asset/images/amazon_in.png',
            width: 120,
            height: 45,
            ),
          actions: [

            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.notifications_outlined)),
            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.search))
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,

            ),
          ),
        ),
        
      ),
      body:  Container(),
    );
  }
}