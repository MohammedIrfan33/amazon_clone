import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, required this.onTab});

  final String buttonText;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: GlobalVariables.secondaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),

      onPressed: onTab,
      child: Text(buttonText,style: TextStyle(color: Colors.white),),
      

    );
  }
}