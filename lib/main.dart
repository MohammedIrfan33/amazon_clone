import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:amazon_clone/features/auth/screen/auth_screen.dart';
import 'package:amazon_clone/rotes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      onGenerateRoute: (settings) => generateRoute(settings),
  
      
      theme: ThemeData(

        scaffoldBackgroundColor:  GlobalVariables.backgroundColor,
        
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
          onPrimary: Colors.white

        ),
        primaryTextTheme: TextTheme(
          
        ),
     
        textTheme: TextTheme(
          
          
        ),
        

        buttonTheme: ButtonThemeData(

           colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
          onPrimary: Colors.white

        ),
          
        ),
        
        appBarTheme: const AppBarTheme(
          color: GlobalVariables.secondaryColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )

        ),


        
    
      ),
      home: AuthScreen()
    
    );
  }
}
