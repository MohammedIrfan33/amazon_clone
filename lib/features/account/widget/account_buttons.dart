import 'package:flutter/material.dart';

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key, required this.onTab, required this.text});


  final VoidCallback onTab;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black12.withOpacity(.03)
      ),
      onPressed: onTab,   
      child: Text(text),
      );
  }
}