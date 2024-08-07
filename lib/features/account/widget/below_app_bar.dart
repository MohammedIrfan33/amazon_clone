import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context).user;
    return  Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      child: RichText(
        text: TextSpan(
          text: 'Hello ,',
          style: const  TextStyle(
            fontSize: 22,
            color: Colors.black
          ),
          children: [
            TextSpan(
              text: user.name,
              style:  const  TextStyle(
                fontSize: 22
              )

            )
          ]
        )
         ),
    );
  }
}