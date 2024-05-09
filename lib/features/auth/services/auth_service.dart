import 'dart:convert';
import 'dart:js';

import 'package:amazon_clone/constants/error_handle.dart';
import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService{

  //signup
  void signUpUser({
    required String email,
    required String password,
    required String name,
    required BuildContext context
  }) async{


    try{

      UserModel user = UserModel(
        id: '', 
        email: email, 
        password: password, 
        address: '', 
        type: '', 
        token: ''
        );

        http.Response res =   await http.post(Uri.parse('$baseUrl/api/signup'),
        body: jsonEncode(user.toJson()),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset= UTF-8'
        }
        );

        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: (){

            showSnackBar(context: context, text: 'Account created ! login  your account');


          }
        );

    }catch(e){

      showSnackBar(context: context, text: e.toString());

    }


  }


}