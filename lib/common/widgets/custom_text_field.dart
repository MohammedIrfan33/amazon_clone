import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38
          )
        ),
         enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38
          )
        ),
        
      ),
      validator: (value) {
        if(value == null || value.isEmpty){

          return 'Enter your $hintText';
        }
      },

    );
  }
}